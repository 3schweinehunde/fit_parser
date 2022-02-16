import 'package:fit_parser/src/fields/segment_lap_fields.dart';
import 'package:fit_parser/src/fields/user_profile_fields.dart';
import 'package:fit_parser/src/fields/device_settings_fields.dart';
import 'package:fit_parser/src/fields/sport_fields.dart';
import 'package:fit_parser/src/fields/workout_fields.dart';
import 'package:fit_parser/src/fields/workout_step_fields.dart';
import 'package:fit_parser/src/fields/zones_target_fields.dart';
import 'package:fit_parser/src/fields/exercise_title_fields.dart';

class GarminActivityFile {
  Map messages = {
    'user_profile': userProfileFields,
    'device_settings': deviceSettingsFields,
    'sport': sportFields,
    'zones_target': zonesTargetFields,
    'segment_lap': segmentLapFields,
    'workout': workoutFields,
    'workout_step': workoutStepFields,
    'exercise_title': exerciseTitleFields,
  };
}
