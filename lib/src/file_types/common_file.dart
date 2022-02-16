import 'package:fit_parser/src/fields/field_description_fields.dart';
import 'package:fit_parser/src/fields/file_creator_fields.dart';
import 'package:fit_parser/src/fields/file_id_fields.dart';
import 'package:fit_parser/src/fields/timestamp_correlation_fields.dart';
import 'package:fit_parser/src/fields/developer_data_id_fields.dart';

class CommonFile {
  Map messages = {
    'file_id': fileIdFields,
    'file_creator': fileCreatorFields,
    'timestamp_correlation': timestampCorrelationFields,
    'developer_data_id': developerDataIdFields,
    'field_description': fieldDescriptionFields,
  };
}
