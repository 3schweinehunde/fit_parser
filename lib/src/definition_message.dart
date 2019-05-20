import 'dart:typed_data';
import 'fit_type.dart';
import 'dart:io';

class DefinitionMessage {
  bool developerData;
  int localMessageType;
  Endian architecture;
  int globalMessageNumber;
  int numberOfFields;
  int numberOfDeveloperFields;

  debugPrint() {
    print("=== Definition Message ===");
    print("develper_data: $developerData");
    print("local_message_type: $localMessageType");
    print("global_message_number: $globalMessageNumber - ${FitType.type["mesg_num"][globalMessageNumber]}");
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

    for (var fields = 0; fields < numberOfFields; fields++ ){

      fitFile.pointer += 3;
    }

    if (developerData) {
      numberOfDeveloperFields = fitFile._byteData.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      for (var fields = 0; fields < numberOfFields; fields++ ){
        //TODO
        fitFile.pointer += 3;
      }
    }

    debugPrint();
    exit(0);
  }
}