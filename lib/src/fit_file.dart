import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'definition_message.dart';
import 'data_message.dart';
import 'developer.dart';

class FitFile {
  String path;
  Endian endianness = Endian.little;

  int fileHeaderLength;
  int protocolVersion;
  int profileVersion;
  int dataSize;
  int lineNumber = 0;
  String dataType;
  int crc;
  int printFrom = 2289;
  int printTo = 2291;

  ByteBuffer buffer;
  List<int> _fileBytes;
  ByteData byteData;
  int pointer;

  Map definitionMessages = Map();
  List<DataMessage> dataMessages = List();
  List<Developer> developers = List();
  parse() {
    File file = File(path);
    _fileBytes = file.readAsBytesSync();
    buffer = new Int8List.fromList(_fileBytes).buffer;
    byteData = new ByteData.view(buffer);

    get_file_header();

    while (pointer < fileHeaderLength + dataSize) {
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
    print("protocolVersion: ${protocolVersion}");
    profileVersion  = byteData.getUint16(2, endianness);
    print("profileVersion: ${profileVersion}");
    dataSize = byteData.getUint32(4, endianness);
    print("dataSize: ${dataSize}");
    dataType = AsciiDecoder().convert(buffer.asUint8List(8, 4));
    print("dataType: ${dataType}");

    if (fileHeaderLength == 14) {
      this.crc = byteData.getUint16(12, endianness);
      print("crc: ${crc}");
    }
  }

  get_next_record({debug = false}) {
    int recordHeader = byteData.getUint8(pointer);
    pointer += 1;
    lineNumber += 1;

    if (recordHeader & 64 == 64) {
      if (lineNumber < printTo && lineNumber >= printFrom - 1) {
        print("${lineNumber + 1} DefinitionMessage");
      };
      DefinitionMessage definitionMessage =
        DefinitionMessage(
            fitFile: this,
            recordHeader: recordHeader
        );
      definitionMessages[definitionMessage.localMessageType] = definitionMessage;
    } else {
      if (lineNumber < printTo && lineNumber >= printFrom - 1) {
        print("${lineNumber + 1} DataMessage");
      };
      DataMessage dataMessage =
        DataMessage(
            fitFile: this,
            recordHeader: recordHeader
        );
      dataMessages.add(dataMessage);
    };
  }
}
