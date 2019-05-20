import 'dart:typed_data';
import 'dart:io';
import 'package:dart/src/fields/base_types.dart';
import 'package:dart/src/fit_type.dart';


class DefinitionMessage {
  bool developerData;
  int localMessageType;
  Endian architecture;
  int globalMessageNumber;
  int numberOfFields;
  int numberOfDeveloperFields;
  Map fields;

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
      fields[fieldCounter]["fieldDefinitionNumber"] = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      fields[fieldCounter]["size"] = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      fields[fieldCounter]["baseTypeByte"] = fitFile._byteData.getUint8(fitFile.pointer);
      fields[fieldCounter]["endianAbility"] = fields[fieldCounter]["baseTypeByte"] & 128 == 128;
      fields[fieldCounter]["baseTypeNumber"] = fields[fieldCounter]["baseTypeByte"] & 31;
      fields[fieldCounter]["baseType"] = base_types[fields[fieldCounter]]["type_name"];
      fitFile.pointer += 1;
    }

    if (developerData) {
      numberOfDeveloperFields = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      for (var fieldCounter = 1; fieldCounter <= numberOfFields; fieldCounter++ ){
        fields[fieldCounter]["fieldNumber"] = fitFile._byteData.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        fields[fieldCounter]["size"] = fitFile._byteData.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        fields[fieldCounter]["developerDataIndex"] = fitFile._byteData.getUint8(fitFile.pointer);
        fitFile.pointer += 1;
      }
    }

    debugPrint();
    exit(0);
  }
}