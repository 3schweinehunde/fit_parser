class Value {
  String field_name;
  String field_type_name;
  String data_type;
  String size;
  int baseTypeByte;

  dynamic get value {
    
  }

  Value({message_type_field, field}) {
    field_name = message_type_field["name"];
    field_type_name = message_type_field["field_type"];
    data_type = message_type_field["data_type"];
    size = field.size;
    baseTypeByte = field.baseTypeByte;
  }
}