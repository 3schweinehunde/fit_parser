import 'package:dart/src/fields/base_types.dart';
import 'package:dart/src/file_types/common_file.dart';
import 'package:dart/src/file_types/activity_file.dart';
import 'package:dart/src/file_types/garmin_activity_file.dart';
import 'package:dart/src/fit_type.dart';

class Field {
  int fieldDefinitionNumber;
  int size;
  int baseTypeByte;
  double scale;
  double offset;
  String dataType;
  String units;
  String fieldName;
  String fieldType;
  int globalMessageNumber;
  String messageTypeName;
  Map fileTypeFields;
  Map messageTypeFields;

  bool get endianAbility => baseTypeByte & 128 == 128;
  int get baseTypeNumber => baseTypeByte & 31;
  String get baseType => base_types[baseTypeNumber]["type_name"];

  Field({
    this.fieldDefinitionNumber,
    this.size,
    this.baseTypeByte,
    this.globalMessageNumber
  }) {
    messageTypeName = FitType.type['mesg_num'][globalMessageNumber];

    if (messageTypeName != null) {
      fileTypeFields = CommonFile().messages[messageTypeName]
          ?? ActivityFile().messages[messageTypeName]
          ?? GarminActivityFile().messages[messageTypeName];

      messageTypeFields = fileTypeFields[fieldDefinitionNumber];
      if (messageTypeFields != null) {
        fieldName = messageTypeFields["field_name"];
        fieldType = messageTypeFields["field_type"];
        dataType = messageTypeFields["data_type"];
        scale =
        (messageTypeFields["scale"] != null) ? messageTypeFields["scale"]
            .toDouble() : 1;
        offset =
        (messageTypeFields["offset"] != null) ? messageTypeFields["offset"]
            .toDouble() : 0;
        units = messageTypeFields["units"];
      } else {
        fieldName = "unknown";
        fieldType = "unknown";
        dataType = "unknown";
        scale = 1;
        offset = 0;
        units = "unknown";
      }
    }
  }

  toString() {
    return {
      "fieldDefinitionNumber": fieldDefinitionNumber,
      "fieldName": fieldName,
      "dataType": dataType,
      "fieldType": fieldType,
      "messageTypeName": messageTypeName,
      'size': size,
      'baseTypeByte': baseTypeByte,
      'globalMessageNumber': globalMessageNumber,
    }.toString();
  }
}