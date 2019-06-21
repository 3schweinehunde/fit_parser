import 'dart:io';

import 'package:dart/src/definition_message.dart';
import 'package:dart/src/developer_field.dart';
import 'package:dart/src/field.dart';
import 'package:dart/src/fit_file.dart';
import 'package:dart/src/value.dart';

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

    fields = definitionMessage.fields;
    fields.forEach((field) {
      Value value = Value(
        fitFile: fitFile,
        field: field,
      );
      values.add(value);
    });

    developerFields = definitionMessage.developerFields;
    developerFields.forEach((developerField) {
      // TODO developerFields
    });

    values = values.map((value) => value.resolveReference(values: values)).toList();

    values.asMap().forEach((number, value) {
      print("    ${number + 1} ${value.fieldName}: ${value.value} / pointer: ${value.pointer}");
    });
  }
}