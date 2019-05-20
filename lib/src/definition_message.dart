import 'dart:typed_data';
import 'dart:io';
import 'package:dart/src/developer_field.dart';
import 'package:dart/src/field.dart';
import 'package:dart/src/fit_type.dart';


class DefinitionMessage {
  bool developerData;
  int localMessageType;
  Endian architecture;
  int globalMessageNumber;
  int numberOfFields;
  int numberOfDeveloperFields;
  Map fields;
  Map developerFields;

  debugPrint() {
    print("=== Definition Message ===");
    print("develper_data: $developerData");
    print("local_message_type: $localMessageType");
    print("global_message_number: $globalMessageNumber - ${FitType.type["mesg_num"][globalMessageNumber]}");
    print('fields: $fields');
  }

  DefinitionMessage({fitFile, recordHeader}) {
    developerData = recordHeader & 32 == 32;
    localMessageType = recordHeader & 15;

    // Reserved Byte, we skip it
    fitFile.pointer += 1;

    if (fitFile._byteData.getUint8(fitFile.pointer) == 1) {
      architecture = Endian.big;
    } else {
      architecture = Endian.little;
    }
    fitFile.endianness = architecture;
    fitFile._pointer += 1;

    globalMessageNumber =
        fitFile._byteData.getUint16(fitFile.pointer, fitFile.endianness);
    fitFile.pointer += 2;

    numberOfFields = fitFile._byteData.getUint8(fitFile.pointer);
    fitFile.pointer += 1;

    for (var fieldCounter = 1; fieldCounter <= numberOfFields; fieldCounter++ ){
      int definitionNumber = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      int size = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      int baseTypeByte = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      Field field = Field(
          fieldDefinitionNumber: definitionNumber,
          size: size,
          baseTypeByte: baseTypeByte);

      fields[fieldCounter] = field;
    }

    if (developerData) {
      numberOfDeveloperFields = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      for (var developerFieldCounter = 1; developerFieldCounter <= numberOfFields; developerFieldCounter++){
        int fieldNumber = fitFile._byteData.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        int size = fitFile._byteData.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        int developerDataIndex = fitFile._byteData.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        DeveloperField developerField = DeveloperField(
            fieldNumber: fieldNumber,
            size: size,
            developerDataIndex: developerDataIndex);
        developerFields[developerFieldCounter] = developerField;
      }
    }

    debugPrint();
    exit(0);
  }
}