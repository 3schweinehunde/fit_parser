import 'package:fit_parser/src/fields/connectivity_fields.dart';
import 'package:fit_parser/src/fields/device_settings_fields.dart';
import 'package:fit_parser/src/fields/hrm_profile_fields.dart';
import 'package:fit_parser/src/fields/ohr_settings_fields.dart';
import 'package:fit_parser/src/fields/sdm_profile_fields.dart';
import 'package:fit_parser/src/fields/user_profile_fields.dart';
import 'package:fit_parser/src/fields/watchface_settings_fields.dart';

class SettingsFile {
  Map messages = {
    'device_settings': device_settings_fields,
    'user_profile': user_profile_fields,
    'hrm_profile': hrm_profile_fields,
    'sdm_profile': sdm_profile_fields,
    'connectivity': connectivity_fields,
    'watchface_settings': watchface_settings_fields,
    'ohr_settings': ohr_settings_fields,
  };
}
