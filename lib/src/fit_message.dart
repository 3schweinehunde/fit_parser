import 'package:dart/src/fields/device_info.dart';
import 'package:dart/src/fields/event.dart';
import 'package:dart/src/fields/file_id.dart';
import 'package:dart/src/fields/activity.dart';
import 'package:dart/src/fields/hrv.dart';
import 'package:dart/src/fields/lap.dart';
import 'package:dart/src/fields/length.dart';
import 'package:dart/src/fields/record.dart';
import 'package:dart/src/fields/session.dart';
import 'package:dart/src/fields/training_file.dart';
import 'package:dart/src/fields/weather_conditions.dart';

class FitMessage {
  Map messages = {
    'activity': activity_fields,
    'device_info': device_info_fields,
    'event': event_fields,
    'file_id': file_id_fields,
    'hrv': hrv_fields,
    'lap': lap_fields,
    'length': length_fields,
    'record': record_fields,
    'session': session_fields,
    'training_file': training_file_fields,
    'weather_conditions': weather_condition_fields,
  };
}
