import 'package:dart/src/field.dart';
import 'package:dart/src/fields/base_types.dart';
import 'package:dart/src/fit_file.dart';
import 'dart:convert';
import 'package:dart/src/fit_type.dart';

class Value {
  String fieldName;
  String fieldType;
  String dataType;
  int size;
  int baseTypeByte;
  FitFile fitFile;
  dynamic _numericValue;
  double scale;
  double offset;
  String unit;
  dynamic value;
  Field field;
  Map messageTypeField;

  int get baseTypeNumber => baseTypeByte & 31;
  int get baseType => base_types[baseTypeNumber]["type_name"];
  int get baseTypeSize => base_types[baseTypeNumber]["size"];

  dynamic setValue() {
    if (dataType != null) {
      switch (dataType) {
        case "sint8":
          return getIntegers(signed: true, data_type_size: 1);
        case "byte":
        case "enum":
        case "uint8":
        case "uint8z":
          return getIntegers(signed: false, data_type_size: 1);

        case "sint16":
          return getIntegers(signed: true, data_type_size: 2);
        case "uint16":
        case "uint16z":
          return getIntegers(signed: false, data_type_size: 2);

        case "sint32":
          return getIntegers(signed: true, data_type_size: 4);
        case "date_time":
        case "uint32":
        case "uint32z":
          return getIntegers(signed: false, data_type_size: 4);

        case "sint64":
          return getIntegers(signed: true, data_type_size: 8);
        case "uint64":
        case "uint64z":
          return getIntegers(signed: false, data_type_size: 8);

        case "float32":
          return getFloats(data_type_size: 4);
        case "float64":
          return getFloats(data_type_size: 8);

        case "string":
          return getString();
      }
    } else if (fieldType != null) {
      if (FitType.type[fieldType] != null) {
        // TODO resolve references (product -> garmin_product)
        _numericValue = getInt(signed: false, data_type_size: size);
        return FitType.type[fieldType][_numericValue];
      } else {
        throw "Field type $fieldType not available";
      }
    } else {
      throw "Neither data type nor field type available!";
    }
  }

  dynamic getIntegers({signed, data_type_size}) {
    int duplicity = size ~/ data_type_size;
    int value;

    if (duplicity > 1) {
      List values = [];
      for (int counter = 1; counter <= duplicity; counter++) {
        value = getInt(signed: signed, data_type_size: data_type_size);
        value = value ~/ scale - offset.round();
        values.add(value);
        fitFile.pointer += data_type_size;
      }
      ;
      return values;
    } else {
      value = getInt(signed: signed, data_type_size: data_type_size);
      value = value ~/ scale - offset.round();
      fitFile.pointer += data_type_size;
      return value;
    }
  }

  int getInt({signed, data_type_size}) {
    switch (data_type_size) {
      case 1:
        return signed
            ? fitFile.byteData.getInt8(fitFile.pointer)
            : fitFile.byteData.getUint8(fitFile.pointer);
      case 2:
        return signed
            ? fitFile.byteData.getInt16(fitFile.pointer)
            : fitFile.byteData.getUint16(fitFile.pointer);
      case 4:
        return signed
            ? fitFile.byteData.getInt32(fitFile.pointer)
            : fitFile.byteData.getUint32(fitFile.pointer);
      case 8:
        return signed
            ? fitFile.byteData.getInt64(fitFile.pointer)
            : fitFile.byteData.getUint64(fitFile.pointer);
      default:
        throw ("No valid data type size in getInt");
    }
  }

  dynamic getFloats({data_type_size}) {
    int duplicity = size ~/ data_type_size;
    double value;

    if (duplicity > 1) {
      List values = [];
      for (int counter = 1; counter <= duplicity; counter++) {
        value = getFloat(data_type_size: data_type_size);
        value = value / scale - offset;
        values.add(value);
        fitFile.pointer += data_type_size;
      }
      ;
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
        return fitFile.byteData.getFloat32(fitFile.pointer, fitFile.endianness);
      case 8:
        return fitFile.byteData.getFloat64(fitFile.pointer, fitFile.endianness);
      default:
        throw ("No valid data type size in getFloat");
    }
  }

  String getString() {
    String value = AsciiDecoder()
        .convert(fitFile.buffer.asUint8List(fitFile.pointer, size));
    fitFile.pointer += size;
    return value;
  }

  Value({this.fitFile, this.messageTypeField, this.field}) {
    fieldName = messageTypeField["name"];
    fieldType = messageTypeField["field_type"];
    dataType = messageTypeField["data_type"];
    scale = (messageTypeField["scale"] != null) ? double.parse(messageTypeField["scale"]) : 1;
    offset = (messageTypeField["offset"] != null) ? double.parse(messageTypeField["offset"]) : 0;
    unit = messageTypeField["unit"];
    size = field.size;
    baseTypeByte = field.baseTypeByte;
    value = setValue();
  }
}
