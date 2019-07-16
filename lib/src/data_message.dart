import 'package:dart/src/definition_message.dart';
import 'package:dart/src/developer_field_definition.dart';
import 'package:dart/src/field.dart';
import 'package:dart/src/fit_file.dart';
import 'package:dart/src/value.dart';
import 'developer_field.dart';

class DataMessage {
  bool compressedHeader;
  int localMessageType;
  int timeOffset;
  DefinitionMessage definitionMessage;
  List<Field> fields = List();
  List<Value> values = List();
  List<DeveloperField> developerFields = List();

  DataMessage({FitFile fitFile, int recordHeader}) {
    compressedHeader = recordHeader & 128 == 128;
    if (compressedHeader) {
      localMessageType = recordHeader & 96;
      timeOffset = recordHeader & 32;
    } else {
      localMessageType = recordHeader & 15;
    }

    definitionMessage = fitFile.definitionMessages[localMessageType];

    if (fitFile.lineNumber < fitFile.printTo && fitFile.lineNumber >= fitFile.printFrom - 1) {
      print("  globalMessageNumber: ${definitionMessage.globalMessageNumber}");
    };

    fields = definitionMessage.fields;
    fields.forEach((field) {
      Value value = Value(
        fitFile: fitFile,
        field: field,
        architecture: definitionMessage.architecture,
      );
      values.add(value);
    });

    developerFields = definitionMessage.developerFields;
    developerFields.forEach((developerField) {
      Value value = Value.fromDeveloperField(
        fitFile: fitFile,
        developerField: developerField,
        architecture: definitionMessage.architecture,
      );
      values.add(value);
    });

    if (definitionMessage.globalMessageNumber == 206) {
      Map valueMap = Map.fromIterable(values,  key: (value) => value.fieldName, value: (value) => value.value);
      DeveloperFieldDefinition developerFieldDefinition = DeveloperFieldDefinition(
          nativeMesgName: valueMap['native_mesg_num'],
          developerDataIndex: valueMap['developer_data_index'].round(),
          fieldNumber: valueMap['field_definition_number'].round(),
          fieldName: valueMap['field_name'].replaceAll(String.fromCharCode(0x00000), ''),
          units: valueMap['units'].replaceAll(String.fromCharCode(0x00000), ''),
          dataType: valueMap['fit_base_type_id'],
          nativeFieldNum: valueMap['native_field_num'].round(),
      );
      fitFile.developerFieldDefinitions.add(developerFieldDefinition);
    };

    values = values.map((value) => value.resolveReference(values: values)).toList();

    values.asMap().forEach((number, value) {
      if (fitFile.lineNumber < fitFile.printTo && fitFile.lineNumber >= fitFile.printFrom - 1) {
        print("    ${number + 1} ${value.fieldName}: ${value.value} ${value.units} / pointer: ${value.pointer}");
      };
    });
  }
}