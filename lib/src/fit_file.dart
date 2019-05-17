import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'definition_message.dart';
import 'data_message.dart';

class FitFile {
  String path;
  Endian endianness = Endian.little;

  int file_header_length;
  int protocol_version;
  int profile_version;
  int data_size;
  String data_type;
  int crc;

  ByteBuffer _buffer;
  List<int> _fileBytes;
  ByteData _byteData;
  int _pointer;

  List<DefinitionMessage> definition_messages = List();
  List<DataMessage> data_messages = List();

  parse() {
    File file = File(path);
    _fileBytes = file.readAsBytesSync();
    _buffer = new Int8List.fromList(_fileBytes).buffer;
    _byteData = new ByteData.view(_buffer);

    get_file_header();

    while (_pointer < _byteData.lengthInBytes) {
      get_next_record();
    }
}

  FitFile({String path}) {
    this.path = path;
    parse();
  }

  get_file_header() {
    file_header_length = _byteData.getUint8(0);
    _pointer = file_header_length;
    protocol_version = _byteData.getUint8(1);
    profile_version  = _byteData.getUint16(2, endianness);
    data_size = _byteData.getUint32(4, endianness);
    data_type = AsciiDecoder().convert(_buffer.asUint8List(8, 4));

    if (file_header_length == 14) {
      this.crc = _byteData.getUint16(12, endianness);
    }
  }

  get_next_record({debug = false}) {
    int record_header = _byteData.getUint8(_pointer);

    if (record_header & 64 == 64) {
      get_definition_message(record_header);
    } else {
      get_data_message(record_header);
    };
  }

  get_definition_message(record_header) {
    DefinitionMessage definition_message;

    definition_message = DefinitionMessage();
    definition_messages.add(definition_message);
    definition_message.developer_data = record_header & 32 == 32;
    definition_message.local_message_type = record_header & 15;

    _pointer += 1;
    // Reserved Byte, we skip it

    _pointer += 1;
    definition_message.architecture =
        _byteData.getUint8(_pointer) == 1 ? Endian.big : Endian.little;
    endianness = definition_message.architecture;

    _pointer += 1;
     definition_message.global_message_number = _byteData.getUint16(_pointer, endianness);

    if (definition_message.developer_data) {
      //TODO
    }

    definition_message.debugPrint();
    exit(0);
  }

  get_data_message(record_header) {
    DataMessage data_message;

    data_message = DataMessage();
    data_messages.add(data_message);
    data_message.compressed_header = record_header & 128 == 128;
    if (data_message.compressed_header) {
      data_message.local_message_type = record_header & 96;
      data_message.time_offset = record_header & 32;
    } else {
      data_message.local_message_type = record_header & 15;
    }

    data_message.debugPrint();
  }
}
