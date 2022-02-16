import 'package:fit_parser/src/fields/connectivity_fields.dart';
import 'package:fit_parser/src/fields/device_settings_fields.dart';
import 'package:fit_parser/src/fields/hrm_profile_fields.dart';
import 'package:fit_parser/src/fields/ohr_settings_fields.dart';
import 'package:fit_parser/src/fields/sdm_profile_fields.dart';
import 'package:fit_parser/src/fields/user_profile_fields.dart';
import 'package:fit_parser/src/fields/watchface_settings_fields.dart';

class SettingsFile {
  Map messages = {
    'device_settings': deviceSettingsFields,
    'user_profile': userProfileFields,
    'hrm_profile': hrmProfileFields,
    'sdm_profile': sdmProfileFields,
    'connectivity': connectivityFields,
    'watchface_settings': watchfaceSettingsFields,
    'ohr_settings': ohrSettingsFields,
  };
}
