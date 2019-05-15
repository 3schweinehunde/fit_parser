import 'package:dart/src/fields/file_creator.dart';
import 'package:dart/src/fields/file_id.dart';
import 'package:dart/src/fields/timestamp_correlation.dart';

class CommonFile {
  Map messages = {
    'file_id': file_id_fields,
    'file_creator': file_creator_fields,
    'timestamp_correlation': timestamp_correlation_fields,
  };
}