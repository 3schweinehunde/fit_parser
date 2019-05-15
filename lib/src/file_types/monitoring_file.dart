import 'package:dart/src/fields/hr.dart';
import 'package:dart/src/fields/monitoring.dart';
import 'package:dart/src/fields/monitoring_info.dart';
import 'package:dart/src/fields/stress_level.dart';

class MonitoringFile {
  Map messages = {
    'monitoring_info': monitoring_info_fields,
    'monitoring': monitoring_fields,
    'hr': hr_fields,
    'stress_level': stress_level_fields,
  };
}