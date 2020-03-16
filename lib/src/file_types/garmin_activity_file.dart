import 'package:fit_parser/src/fields/segment_lap_fields.dart';
import 'package:fit_parser/src/fields/user_profile_fields.dart';
import 'package:fit_parser/src/fields/device_settings_fields.dart';
import 'package:fit_parser/src/fields/sport_fields.dart';
import 'package:fit_parser/src/fields/zones_target_fields.dart';

class GarminActivityFile {
  Map messages = {
    'user_profile': user_profile_fields,
    'device_settings': device_settings_fields,
    'sport': sport_fields,
    'zones_target': zones_target_fields,
    'segment_lap': segment_lap_fields,
  };
}
