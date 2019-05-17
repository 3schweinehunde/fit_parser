import 'package:dart/src/fields/file_creator_fields.dart';
import 'package:dart/src/fields/file_id_fields.dart';
import 'package:dart/src/fields/timestamp_correlation_fields.dart';

class CommonFile {
  Map messages = {
    'file_id': file_id_fields,
    'file_creator': file_creator_fields,
    'timestamp_correlation': timestamp_correlation_fields,
  };
}