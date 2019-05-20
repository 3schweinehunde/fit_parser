import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'definition_message.dart';
import 'data_message.dart';

class FitFile {
  String path;
  Endian endianness = Endian.little;

  int fileHeaderLength;
  int protocolVersion;
  int profileVersion;
  int dataSize;
  String dataType;
  int crc;

  ByteBuffer _buffer;
  List<int> _fileBytes;
  ByteData _byteData;
  int _pointer;

  Map definitionMessages;
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
    fileHeaderLength = _byteData.getUint8(0);
    _pointer = fileHeaderLength;
    protocolVersion = _byteData.getUint8(1);
    profileVersion  = _byteData.getUint16(2, endianness);
    dataSize = _byteData.getUint32(4, endianness);
    dataType = AsciiDecoder().convert(_buffer.asUint8List(8, 4));

    if (fileHeaderLength == 14) {
      this.crc = _byteData.getUint16(12, endianness);
    }
  }

  get_next_record({debug = false}) {
    int record_header = _byteData.getUint8(_pointer);
    _pointer += 1;

    if (record_header & 64 == 64) {
      DefinitionMessage definition_message =
        DefinitionMessage(
            fitFile: this,
            recordHeader: record_header
        );

      definitionMessages[definition_message.localMessageType] = definition_message;
    } else {
      DataMessage data_message =
        DataMessage(
            fitFile: this,
            recordHeader: record_header
        );
      data_messages.add(data_message);
    };
  }
}
