import 'package:dart/src/fields/field_description_fields.dart';
import 'package:dart/src/fields/file_creator_fields.dart';
import 'package:dart/src/fields/file_id_fields.dart';
import 'package:dart/src/fields/timestamp_correlation_fields.dart';
import 'package:dart/src/fields/developer_data_id_fields.dart';

class CommonFile {
  Map messages = {
    'file_id': file_id_fields,
    'file_creator': file_creator_fields,
    'timestamp_correlation': timestamp_correlation_fields,
    'developer_data_id': developer_data_id_fields,
    'field_description': field_description_fields,
  };
}