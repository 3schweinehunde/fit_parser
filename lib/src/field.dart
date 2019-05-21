import 'package:dart/src/fields/base_types.dart';
import 'package:dart/src/prettify.dart';

class Field {
  int fieldDefinitionNumber;
  int size;
  int baseTypeByte;

  bool get endianAbility => baseTypeByte & 128 == 128;
  int get baseTypeNumber => baseTypeByte & 31;
  int get baseType => base_types[baseTypeNumber]["type_name"];

  toString() {
    return prettify({
      "fieldDefinitionNumber": fieldDefinitionNumber,
      "size": size,
      "baseTypeByte": baseTypeByte,
    });
  }

  Field({fieldDefinitionNumber, size, baseTypeByte}) {}
}