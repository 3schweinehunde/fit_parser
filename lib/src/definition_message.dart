import 'dart:typed_data';
import 'fit_type.dart';

class DefinitionMessage {
  bool developer_data;
  int local_message_type;
  Endian architecture;
  int global_message_number;

  debugPrint() {
    print("=== Definition Message ===");
    print("develper_data: $developer_data");
    print("local_message_type: $local_message_type");
    print("global_message_number: $global_message_number - ${FitType.type["mesg_num"][global_message_number]}");
  }
}