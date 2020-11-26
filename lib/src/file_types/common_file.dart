import 'package:fit_parser/src/fields/capabilities_fields.dart';
import 'package:fit_parser/src/fields/connectivity_fields.dart';
import 'package:fit_parser/src/fields/field_capabilities_fields.dart';
import 'package:fit_parser/src/fields/field_description_fields.dart';
import 'package:fit_parser/src/fields/file_capabilities_fields.dart';
import 'package:fit_parser/src/fields/file_creator_fields.dart';
import 'package:fit_parser/src/fields/file_id_fields.dart';
import 'package:fit_parser/src/fields/mesg_capabilities_fields.dart';
import 'package:fit_parser/src/fields/software_fields.dart';
import 'package:fit_parser/src/fields/timestamp_correlation_fields.dart';
import 'package:fit_parser/src/fields/developer_data_id_fields.dart';

class CommonFile {
  Map messages = {
    'file_id': file_id_fields,
    'file_creator': file_creator_fields,
    'timestamp_correlation': timestamp_correlation_fields,
    'developer_data_id': developer_data_id_fields,
    'field_description': field_description_fields,
    'software': software_fields,
    'capabilities': capabilities_fields,
    'file_capabilities': file_capabilities_fields,
    'field_capabilities': field_capabilities_fields,
    'mesg_capabilities': mesg_capabilities_fields,
    'connectivity': connectivity_fields,
  };
}
