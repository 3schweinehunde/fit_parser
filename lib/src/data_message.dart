import 'package:fit_parser/src/definition_message.dart';
import 'package:fit_parser/src/developer_field_definition.dart';
import 'package:fit_parser/src/field.dart';
import 'package:fit_parser/src/fit_file.dart';
import 'package:fit_parser/src/value.dart';
import 'developer_field.dart';

class DataMessage {
  bool compressedHeader;
  int localMessageType;
  int timeOffset;
  DefinitionMessage definitionMessage;
  List<Field> fields = [];
  List<Value> values = [];
  List<DeveloperField> developerFields = [];

  DataMessage({FitFile fitFile, int recordHeader}) {
    compressedHeader = recordHeader & 128 == 128;
    if (compressedHeader) {
      localMessageType = recordHeader & 96;
      timeOffset = recordHeader & 32;
    } else {
      localMessageType = recordHeader & 15;
    }

    definitionMessage = fitFile.definitionMessages[localMessageType];

    if (fitFile.lineNumber < fitFile.debugPrintTo &&
        fitFile.lineNumber >= fitFile.debugPrintFrom - 1) {
      print('  globalMessageNumber: ${definitionMessage.globalMessageNumber}');
    }

    fields = definitionMessage.fields;
    fields.forEach((field) {
      var value = Value(
        fitFile: fitFile,
        field: field,
        architecture: definitionMessage.architecture,
      );
      values.add(value);
    });

    developerFields = definitionMessage.developerFields;
    developerFields.forEach((developerField) {
      var value = Value.fromDeveloperField(
        fitFile: fitFile,
        developerField: developerField,
        architecture: definitionMessage.architecture,
      );
      values.add(value);
    });

    if (definitionMessage.globalMessageNumber == 206) {
      var valueMap = {for (var value in values) value.fieldName: value.value};
      var developerFieldDefinition = DeveloperFieldDefinition(
        nativeMesgName: valueMap['native_mesg_num'],
        developerDataIndex: valueMap['developer_data_index'].round(),
        fieldNumber: valueMap['field_definition_number'].round(),
        fieldName:
            valueMap['field_name'].replaceAll(String.fromCharCode(0x00000), ''),
        units: valueMap['units'].replaceAll(String.fromCharCode(0x00000), ''),
        dataType: valueMap['fit_base_type_id'],
        nativeFieldNum: valueMap['native_field_num']?ex.round(),
      );
      fitFile.developerFieldDefinitions.add(developerFieldDefinition);
    }

    values =
        values.map((value) => value.resolveReference(values: values)).toList();

    values.asMap().forEach((number, value) {
      if (fitFile.lineNumber < fitFile.debugPrintTo &&
          fitFile.lineNumber >= fitFile.debugPrintFrom - 1) {
        print(
            '    ${number + 1} ${value.fieldName}: ${value.value} ${value.units} / pointer: ${value.pointer}');
      }
    });
  }

  dynamic get(String fieldName) {
    return values
        .singleWhere((value) => value.fieldName == fieldName,
            orElse: () => null)
        ?.value;
  }

  dynamic any(String fieldName) {
    return values.any((value) => value.fieldName == fieldName);
  }
}
