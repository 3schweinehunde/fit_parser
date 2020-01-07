import 'package:fit_parser/src/fields/hr_fields.dart';
import 'package:fit_parser/src/fields/monitoring_fields.dart';
import 'package:fit_parser/src/fields/monitoring_info_fields.dart';
import 'package:fit_parser/src/fields/stress_level_fields.dart';

class MonitoringFile {
  Map messages = {
    'monitoring_info': monitoring_info_fields,
    'monitoring': monitoring_fields,
    'hr': hr_fields,
    'stress_level': stress_level_fields,
  };
}
