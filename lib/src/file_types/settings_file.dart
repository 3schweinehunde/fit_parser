import 'package:dart/src/fields/connectivity.dart';
import 'package:dart/src/fields/device_settings.dart';
import 'package:dart/src/fields/hrm_profile.dart';
import 'package:dart/src/fields/ohr_settings.dart';
import 'package:dart/src/fields/sdm_profile.dart';
import 'package:dart/src/fields/user_profile.dart';
import 'package:dart/src/fields/watchface_settings.dart';

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