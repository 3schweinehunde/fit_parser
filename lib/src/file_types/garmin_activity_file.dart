import 'package:dart/src/fields/user_profile_fields.dart';
import 'package:dart/src/fields/device_settings_fields.dart';

class GarminActivityFile {
  Map messages = {
    'user_profile': user_profile_fields,
    'device_settings': device_settings_fields,
  };
}