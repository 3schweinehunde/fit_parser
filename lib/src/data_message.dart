class DataMessage{
  bool compressed_header;
  int local_message_type;
  int time_offset;

  debugPrint() {
    print("=== Data Message ===");
    print("compressed_header: $compressed_header");
    print("local_message_type: $local_message_type");
    print("time_offset: $time_offset");
  }
}