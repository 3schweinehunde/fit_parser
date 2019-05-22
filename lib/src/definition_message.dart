import 'dart:typed_data';
import 'package:dart/src/developer_field.dart';
import 'package:dart/src/field.dart';
import 'package:dart/src/fit_file.dart';
import 'package:dart/src/fit_type.dart';

class DefinitionMessage {
  bool developerData;
  int localMessageType;
  Endian architecture;
  int globalMessageNumber;
  int numberOfFields;
  int numberOfDeveloperFields;
  List<Field> fields = List();
  List<DeveloperField> developerFields = List();

  get globalMessageName => FitType.type["mesg_num"][globalMessageNumber];

  DefinitionMessage({FitFile fitFile, int recordHeader}) {
    developerData = recordHeader & 32 == 32;
    localMessageType = recordHeader & 15;
    ByteData data = fitFile.byteData;

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

    for (var fieldCounter = 1; fieldCounter <= numberOfFields; fieldCounter++ ){
      int definitionNumber = data.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      int size = data.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      int baseTypeByte = data.getUint8(fitFile.pointer);
      fitFile.pointer+= 1;

      Field field = Field(
          fieldDefinitionNumber: definitionNumber,
          size: size,
          baseTypeByte: baseTypeByte);

      fields.add(field);
    }

    if (developerData) {
      numberOfDeveloperFields = data.getUint8(fitFile.pointer);
      fitFile.pointer += 1;

      for (var developerFieldCounter = 1; developerFieldCounter <= numberOfFields; developerFieldCounter++){
        int fieldNumber = data.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        int size = data.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        int developerDataIndex = data.getUint8(fitFile.pointer);
        fitFile.pointer += 1;

        DeveloperField developerField = DeveloperField(
            fieldNumber: fieldNumber,
            size: size,
            developerDataIndex: developerDataIndex);
        developerFields.add(developerField);
      }
    }
  }
}