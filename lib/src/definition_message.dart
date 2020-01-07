import 'dart:typed_data';
import 'package:fit_parser/src/field.dart';
import 'package:fit_parser/src/fit_file.dart';
import 'package:fit_parser/src/fit_type.dart';

import 'developer_field.dart';

class DefinitionMessage {
  bool developerData;
  int localMessageType;
  Endian architecture;
  int globalMessageNumber;
  int numberOfFields;
  int numberOfDeveloperFields;
  List<Field> fields = [];
  List<DeveloperField> developerFields = [];

  String get globalMessageName => FitType.type['mesg_num'][globalMessageNumber];

  DefinitionMessage({FitFile fitFile, int recordHeader, int lineNumber}) {
    developerData = recordHeader & 32 == 32;
    localMessageType = recordHeader & 15;
    var data = fitFile.byteData;

    // Reserved Byte, we skip it
    fitFile.pointer += 1;

    if (data.getUint8(fitFile.pointer) == 1) {
      architecture = Endian.big;
    } else {
      architecture = Endian.little;
    }

    fitFile.endianness = architecture;
    fitFile.pointer += 1;

    globalMessageNumber = data.getUint16(fitFile.pointer, fitFile.endianness);
    fitFile.pointer += 2;

    numberOfFields = data.getUint8(fitFile.pointer);
    fitFile.pointer += 1;

    if (fitFile.lineNumber < fitFile.printTo && fitFile.lineNumber >= fitFile.printFrom - 1) {
      print('  developerData: ${developerData}, '
          'localMessageType: ${localMessageType}, '
          "architecture: ${architecture == Endian.little ? "little" : "big"}, "
          'globalMessageNumber: ${globalMessageNumber}, '
          'globalMessageName: ${globalMessageName}, '
          'numberOfFields: ${numberOfFields}');
    };

    for (var fieldCounter = 1; fieldCounter <= numberOfFields; fieldCounter++ ){
      var definitionNumber = data.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      var size = data.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      var baseTypeByte = data.getUint8(fitFile.pointer);
      fitFile.pointer+= 1;

      var field = Field(
          fieldDefinitionNumber: definitionNumber,
          size: size,
          baseTypeByte: baseTypeByte,
          globalMessageNumber: globalMessageNumber);

      fields.add(field);
      if (fitFile.lineNumber < fitFile.printTo &&
          fitFile.lineNumber >= fitFile.printFrom - 1) {
        print('    ${fieldCounter} ${field}'
            ' / pointer_after: ${fitFile.pointer}');
      };
    }

    if (developerData) {
      numberOfDeveloperFields = data.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      for (var developerFieldCounter = 1; developerFieldCounter <= numberOfDeveloperFields; developerFieldCounter++){
        var fieldNumber = data.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        var size = data.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        var developerDataIndex = data.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        var developerField = DeveloperField(
            fieldNumber: fieldNumber,
            size: size,
            developerDataIndex: developerDataIndex,
            fitFile: fitFile,
            globalMessageName: globalMessageName,
        );
        developerFields.add(developerField);
        if (fitFile.lineNumber < fitFile.printTo &&
            fitFile.lineNumber >= fitFile.printFrom - 1) {
          print('    dev ${developerFieldCounter} ${developerField}'
                ' / pointer_after: ${fitFile.pointer}');
        };
      }
    }
  }
}