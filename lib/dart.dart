library dart;
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

export 'src/fit_parser.dart';

class FitFile {
  String path;
  Endian endianness = Endian.little;

  static File file(path) => File(path);

  List<int> get fileBytes => file(path).readAsBytesSync();

  ByteBuffer get buffer => new Int8List.fromList(fileBytes).buffer;
  ByteData get byteData => new ByteData.view(buffer);


  int get file_header_length => byteData.getUint8(0);
  int get protocol_version => byteData.getUint8(1);
  int get profile_version  => byteData.getUint16(2, endianness);
  int get data_size => byteData.getUint32(4, endianness);
  String get data_type => AsciiDecoder().convert(buffer.asUint8List(8, 4));

  int get crc {
    if (file_header_length == 14) {
      byteData.getUint16(12, endianness);
    }
  }

  Map get metadata => {
    'file_header_length': file_header_length,
    'protocol_version': protocol_version,
    'profile_version': profile_version,
    'data_size': data_size,
    'data_type': data_type,
    'crc': crc,
  };

  FitFile({String path}) {
    this.path = path;
  }

}
