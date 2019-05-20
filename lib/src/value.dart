import 'package:dart/src/fields/base_types.dart';
import 'package:dart/src/fit_file.dart';
import 'dart:convert';

import 'package:dart/src/fit_type.dart';

class Value {
  String field_name;
  String field_type;
  String data_type;
  int size;
  int baseTypeByte;
  FitFile fitFile;
  dynamic _numeric_value;
  double scale;
  double offset;
  String unit;

  int get baseTypeNumber => baseTypeByte & 31;
  int get baseType => base_types[baseTypeNumber]["type_name"];
  int get baseTypeSize => base_types[baseTypeNumber]["size"];

  dynamic get value {
    if (data_type != null) {
      switch (data_type) {
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
    } else if (field_type != null) {
      if (FitType.type[field_type]) {
        _numeric_value = getInt(signed: false, data_type_size: size);
        return FitType.type[field_type][_numeric_value];
      } else {
        throw "Field type $field_type not available";
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
        value = (scale != null) ? value / scale : value;
        values.add(value);
        fitFile.pointer += data_type_size;
      }
      ;
      return values;
    } else {
      getInt(signed: signed, data_type_size: data_type_size);
      fitFile.pointer += data_type_size;
      return value;
    }
  }

  int getInt({signed, data_type_size}) {
    switch (data_type_size) {
      case 8:
        return signed
            ? fitFile.byteData.getInt8(fitFile.pointer)
            : fitFile.byteData.getUint8(fitFile.pointer);
      case 16:
        return signed
            ? fitFile.byteData.getInt16(fitFile.pointer)
            : fitFile.byteData.getUint16(fitFile.pointer);
      case 32:
        return signed
            ? fitFile.byteData.getInt32(fitFile.pointer)
            : fitFile.byteData.getUint32(fitFile.pointer);
      case 64:
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
        getFloat(data_type_size: data_type_size);
        values.add(value);
        fitFile.pointer += data_type_size;
      }
      ;
      return values;
    } else {
      getFloat(data_type_size: data_type_size);
      fitFile.pointer += data_type_size;
      return value;
    }
  }

  double getFloat({signed, data_type_size}) {
    switch (data_type_size) {
      case 32:
        return fitFile.byteData.getFloat32(fitFile.pointer, fitFile.endianness);
      case 64:
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

  Value({FitFile fitFile, message_type_field, field}) {
    field_name = message_type_field["name"];
    field_type = message_type_field["field_type"];
    data_type = message_type_field["data_type"];
    scale = double.parse(message_type_field["scale"]);
    offset = double.parse(message_type_field["unit"]);
    unit = message_type_field["unit"];
    size = field.size;
    baseTypeByte = field.baseTypeByte;
  }
}
