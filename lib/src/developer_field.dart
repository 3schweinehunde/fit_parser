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
      (developerFieldDefinition.fieldNumber == fieldNumber) &&
      (developerFieldDefinition.developerDataIndex == developerDataIndex) &&
      (developerFieldDefinition.nativeMesgName == globalMessageName)
    );

    fieldName = developerFieldDefinition.fieldName;
    nativeFieldNum = developerFieldDefinition.nativeFieldNum;
    dataType = developerFieldDefinition.dataType;
    units = developerFieldDefinition.units;
  }

  @override
  String toString() {
    return {
      'fieldNumber': fieldNumber,
      'fieldName': fieldName,
      'dataType': dataType,
      'size': size,
      'nativeFieldNum': nativeFieldNum,
      'unit': units,
      'developerDataIndex': developerDataIndex,
      'nativeMesgName': nativeMesgName,
    }.toString();
  }
}
