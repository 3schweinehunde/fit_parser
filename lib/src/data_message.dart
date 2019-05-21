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
  List fields = List();
  List values = List();
  List developerFields = List();

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
    fields.forEach((field) {
      String messageTypeName = FitType.type['mesg_num'][definitionMessage.globalMessageNumber];

      Map messageTypeFields = CommonFile().messages[messageTypeName];
      messageTypeFields ??= ActivityFile().messages[messageTypeName];

      int field_type = field.fieldDefinitionNumber;

      Map messageTypeField = messageTypeFields[field_type];

      Value value = Value(
          fitFile: fitFile,
          messageTypeField: messageTypeField,
          field: field,
      );
      print(value);
      values.add(value);
    });

    developerFields = definitionMessage.developerFields;
    developerFields.forEach((developerField) {
      // TODO developerFields
    });
  }
}