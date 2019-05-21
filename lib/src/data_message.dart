import 'package:dart/src/definition_message.dart';
import 'package:dart/src/file_types/common_file.dart';
import 'package:dart/src/fit_file.dart';
import 'package:dart/src/fit_type.dart';
import 'package:dart/src/value.dart';

import 'file_types/activity_file.dart';

class DataMessage{
  bool compressedHeader;
  int localMessageType;
  int timeOffset;
  DefinitionMessage definitionMessage;
  Map fields = Map();
  Map developerFields = Map();

  DataMessage({FitFile fitFile, int recordHeader}) {
    compressedHeader = recordHeader & 128 == 128;
    if (compressedHeader) {
      localMessageType = recordHeader & 96;
      timeOffset = recordHeader & 32;
    } else {
      localMessageType = recordHeader & 15;
    }

    definitionMessage = fitFile.definitionMessages[localMessageType];

    fields = definitionMessage.fields;
    fields.forEach((key, field) {
      String message_type_name = FitType.type['mesg_num'][definitionMessage.globalMessageNumber];

      Map message_type_fields = CommonFile().messages[message_type_name];
      message_type_fields ??= ActivityFile().messages[message_type_name];

      int field_type = field.fieldDefinitionNumber;

      Map message_type_field = message_type_fields[field_type];

      Value value = Value(
          fitFile: fitFile,
          message_type_field: message_type_field,
          field: field,
      );
      print(value);
    });

    developerFields = definitionMessage.developerFields;
    fields.forEach((key, field) {
      // TODO developerFields
    });


    print(this);
  }
}