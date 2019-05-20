import 'package:dart/src/fields/base_types.dart';

class Field {
  int fieldDefinitionNumber;
  int size;
  int baseTypeByte;

  bool get endianAbility => baseTypeByte & 128 == 128;
  int get baseTypeNumber => baseTypeByte & 31;
  int get baseType => base_types[baseTypeNumber]["type_name"];

  Field({fieldDefinitionNumber, size, baseTypeByte}) {}
}