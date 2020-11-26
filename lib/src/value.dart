import 'package:fit_parser/src/developer_field.dart';
import 'package:fit_parser/src/field.dart';
import 'package:fit_parser/src/fields/base_types.dart';
import 'package:fit_parser/src/fit_file.dart';
import 'dart:convert';
import 'package:fit_parser/src/fit_type.dart';
import 'dart:typed_data';

class Value {
  String fieldName;
  String fieldType;
  String dataType;
  int size;
  int baseTypeByte;
  FitFile fitFile;
  dynamic _numericValue;
  dynamic scale;
  double offset;
  String units;
  dynamic value;
  Field field;
  DeveloperField developerField;
  Map messageTypeFields;
  int pointer;
  Endian architecture;

  int get baseTypeNumber => baseTypeByte & 31;
  int get baseType => base_types[baseTypeNumber]['type_name'];
  int get baseTypeSize => base_types[baseTypeNumber]['size'];

  Value resolveReference({List<Value> values}) {
    if (messageTypeFields != null) {
      var referenceFieldName = messageTypeFields['reference_field_name'];
      Value referenceValue;

      // Reference field replacement
      if (referenceFieldName != null) {
        referenceValue = values.firstWhere((currentValue) {
          return (currentValue.messageTypeFields != null) &&
              (currentValue.messageTypeFields['field_name'] ==
                  referenceFieldName);
        }, orElse: () => null);
        if (referenceValue != null) {
          Map reference =
              messageTypeFields['reference_field_value'][referenceValue.value];
          if (reference != null) {
            fieldName = reference['field_name'] ?? fieldName;
            fieldType = reference['field_type'] ?? fieldType;
            dataType = reference['data_type'] ?? dataType;
            units = reference['data_type'] ?? units;
            scale = reference['scale'] ?? scale;
            offset = reference['offset'] ?? offset;
            value = fieldType != null ? lookupValue() : value;
          }
        }
      }
    }
    return this;
  }

  dynamic lookupValue() {
    if (FitType.type[fieldType] != null) {
      // fieldType parsing
      _numericValue ??= getInt(signed: false, data_type_size: size);
      dynamic _lookup = FitType.type[fieldType][_numericValue] ?? _numericValue;
      return _lookup;
    } else if (fieldType == 'unknown') {
      return null;
    } else {
      throw 'Field type $fieldType not available';
    }
  }

  dynamic determineValue() {
    // Data parsing
    if (fieldType != null) {
      dynamic lookedUpValue = lookupValue();
      fitFile.pointer += size;
      return lookedUpValue;
    } else if (dataType != null) {
      // dataType parsing
      switch (dataType) {
        case 'bool':
          return getBool();
        case 'sint8':
          return getIntegers(signed: true, data_type_size: 1);
        case 'byte':
        case 'enum':
        case 'uint8':
        case 'uint8z':
          return getIntegers(signed: false, data_type_size: 1);

        case 'sint16':
          return getIntegers(signed: true, data_type_size: 2);
        case 'uint16':
        case 'uint16z':
          return getIntegers(signed: false, data_type_size: 2);

        case 'sint32':
          return getIntegers(signed: true, data_type_size: 4);
        case 'date_time':
        case 'local_date_time':
        case 'localtime_into_day':
        case 'uint32':
        case 'uint32z':
          return getIntegers(signed: false, data_type_size: 4);

        case 'sint64':
          return getIntegers(signed: true, data_type_size: 8);
        case 'uint64':
        case 'uint64z':
          return getIntegers(signed: false, data_type_size: 8);

        case 'float32':
          return getFloats(data_type_size: 4);
        case 'float64':
          return getFloats(data_type_size: 8);

        case 'string':
          return getString();
      }
    } else {
      // Neither data type nor field type available!
      fitFile.pointer += size;
      return null;
    }
  }

  dynamic getIntegers({signed, data_type_size}) {
    var duplicity = size ~/ data_type_size;
    dynamic value;

    if (duplicity > 1) {
      var values = [];
      for (var counter = 1; counter <= duplicity; counter++) {
        value = getInt(signed: signed, data_type_size: data_type_size);
        value = value / scale - offset.round();
        values.add(value);
        fitFile.pointer += data_type_size;
      }
      return values;
    } else {
      _numericValue = getInt(signed: signed, data_type_size: data_type_size);
      value = _numericValue / scale - offset.round();
      fitFile.pointer += data_type_size;
      return value;
    }
  }

  bool getBool() {
    bool tempValue;
    if (fitFile.byteData.getInt8(fitFile.pointer) == 0) {
      tempValue = false;
    } else {
      tempValue = true;
    }
    fitFile.pointer += 1;
    return tempValue;
  }

  int getInt({signed, data_type_size}) {
    switch (data_type_size) {
      case 1:
        return signed
            ? fitFile.byteData.getInt8(fitFile.pointer)
            : fitFile.byteData.getUint8(fitFile.pointer);
      case 2:
        return signed
            ? fitFile.byteData.getInt16(fitFile.pointer, architecture)
            : fitFile.byteData.getUint16(fitFile.pointer, architecture);
      case 4:
        return signed
            ? fitFile.byteData.getInt32(fitFile.pointer, architecture)
            : fitFile.byteData.getUint32(fitFile.pointer, architecture);
      case 8:
        return signed
            ? fitFile.byteData.getInt64(fitFile.pointer, architecture)
            : fitFile.byteData.getUint64(fitFile.pointer, architecture);
      default:
        throw ('No valid data type size in getInt');
    }
  }

  dynamic getFloats({data_type_size}) {
    var duplicity = size ~/ data_type_size;
    double value;

    if (duplicity > 1) {
      var values = [];
      for (var counter = 1; counter <= duplicity; counter++) {
        value = getFloat(data_type_size: data_type_size);
        value = value / scale - offset;
        values.add(value);
        fitFile.pointer += data_type_size;
      }
      return values;
    } else {
      value = getFloat(data_type_size: data_type_size);
      value = value / scale - offset;
      fitFile.pointer += data_type_size;
      return value;
    }
  }

  double getFloat({signed, data_type_size}) {
    switch (data_type_size) {
      case 4:
        return fitFile.byteData.getFloat32(fitFile.pointer, architecture);
      case 8:
        return fitFile.byteData.getFloat64(fitFile.pointer, architecture);
      default:
        throw ('No valid data type size in getFloat');
    }
  }

  String getString() {
    var value = AsciiCodec().decode(
        fitFile.buffer.asUint8List(fitFile.pointer, size),
        allowInvalid: true);
    fitFile.pointer += size;
    return value;
  }

  Value({this.fitFile, this.field, this.architecture}) {
    pointer = fitFile.pointer;
    messageTypeFields = field.messageTypeFields;
    fieldName = field.fieldName;
    fieldType = field.fieldType;
    dataType = field.dataType;
    scale = field.scale;
    offset = field.offset;
    units = field.units;
    size = field.size;
    baseTypeByte = field.baseTypeByte;
    value = determineValue();
  }

  Value.fromDeveloperField({
    this.fitFile,
    this.developerField,
    this.architecture,
  }) {
    pointer = fitFile.pointer;
    size = developerField.size;
    dataType = developerField.dataType;
    units = developerField.units;
    fieldName = developerField.fieldName;
    scale = 1;
    offset = 0;
    value = determineValue();
  }

  Object toJson() => {
        'fieldName': fieldName,
        'fieldType': fieldType,
        'dataType': dataType,
        'size': size,
        'baseTypeByte': baseTypeByte,
        'scale': scale,
        'units': units,
        'value': value,
      };
}
