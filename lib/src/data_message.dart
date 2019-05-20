class DataMessage{
  bool compressedHeader;
  int localMessageType;
  int timeOffset;

  debugPrint() {
    print("=== Data Message ===");
    print("compressed_header: $compressedHeader");
    print("local_message_type: $localMessageType");
    print("time_offset: $timeOffset");
  }

  DataMessage({fitFile, recordHeader}) {
    compressedHeader = recordHeader & 128 == 128;
    if (compressedHeader) {
      localMessageType = recordHeader & 96;
      timeOffset = recordHeader & 32;
    } else {
      localMessageType = recordHeader & 15;
    }

    debugPrint();
  }
}