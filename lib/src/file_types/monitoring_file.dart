import 'package:fit_parser/src/fields/hr_fields.dart';
import 'package:fit_parser/src/fields/monitoring_fields.dart';
import 'package:fit_parser/src/fields/monitoring_info_fields.dart';
import 'package:fit_parser/src/fields/stress_level_fields.dart';

class MonitoringFile {
  Map messages = {
    'monitoring_info': monitoringInfoFields,
    'monitoring': monitoringFields,
    'hr': hrFields,
    'stress_level': stressLevelFields,
  };
}
