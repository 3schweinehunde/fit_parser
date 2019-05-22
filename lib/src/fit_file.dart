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

  ByteBuffer buffer;
  List<int> _fileBytes;
  ByteData byteData;
  int pointer;

  Map definitionMessages = Map();
  List<DataMessage> dataMessages = List();

  parse() {
    File file = File(path);
    _fileBytes = file.readAsBytesSync();
    buffer = new Int8List.fromList(_fileBytes).buffer;
    byteData = new ByteData.view(buffer);

    get_file_header();

    while (pointer < byteData.lengthInBytes) {
      get_next_record();
    }
}

  FitFile({String path}) {
    this.path = path;
    parse();
  }

  get_file_header() {
    fileHeaderLength = byteData.getUint8(0);
    pointer = fileHeaderLength;
    protocolVersion = byteData.getUint8(1);
    profileVersion  = byteData.getUint16(2, endianness);
    dataSize = byteData.getUint32(4, endianness);
    dataType = AsciiDecoder().convert(buffer.asUint8List(8, 4));

    if (fileHeaderLength == 14) {
      this.crc = byteData.getUint16(12, endianness);
    }
  }

  get_next_record({debug = false}) {
    int recordHeader = byteData.getUint8(pointer);
    pointer += 1;

    if (recordHeader & 64 == 64) {
      DefinitionMessage definitionMessage =
        DefinitionMessage(
            fitFile: this,
            recordHeader: recordHeader,
        );

      definitionMessages[definitionMessage.localMessageType] = definitionMessage;
    } else {
      DataMessage dataMessage =
        DataMessage(
            fitFile: this,
            recordHeader: recordHeader
        );

      dataMessages.add(dataMessage);
    };
  }
}
