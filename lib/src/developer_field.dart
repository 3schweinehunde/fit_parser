import 'fit_file.dart';

class DeveloperField {
  int fieldNumber;
  int developerDataIndex;
  String fieldName;
  int size;
  int nativeFieldNum;
  String dataType;
  String units;
  String nativeMesgName;

  DeveloperField({
    this.fieldNumber,
    this.size,
    this.developerDataIndex,
    FitFile fitFile,
    String globalMessageName
  }) {
    var developerFieldDefinition = fitFile.developerFieldDefinitions.firstWhere((developerFieldDefinition) =>
      (developerFieldDefinition.fieldNumber == this.fieldNumber) &&
      (developerFieldDefinition.developerDataIndex == this.developerDataIndex) &&
      (developerFieldDefinition.nativeMesgName == globalMessageName)
    );

    this.fieldName = developerFieldDefinition.fieldName;
    this.nativeFieldNum = developerFieldDefinition.nativeFieldNum;
    this.dataType = developerFieldDefinition.dataType;
    this.units = developerFieldDefinition.units;
  }

  toString() {
    return {
      "fieldNumber": fieldNumber,
      "fieldName": fieldName,
      "dataType": dataType,
      'size': size,
      'nativeFieldNum': nativeFieldNum,
      'unit': units,
      "developerDataIndex": developerDataIndex,
      "nativeMesgName": nativeMesgName,
    }.toString();
  }
}
