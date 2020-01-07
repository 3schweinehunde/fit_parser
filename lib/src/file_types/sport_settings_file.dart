import 'package:fit_parser/src/fields/cadence_zone_fields.dart';
import 'package:fit_parser/src/fields/dive_alarm_fields.dart';
import 'package:fit_parser/src/fields/dive_gas_fields.dart';
import 'package:fit_parser/src/fields/dive_settings_fields.dart';
import 'package:fit_parser/src/fields/hr_zone_fields.dart';
import 'package:fit_parser/src/fields/met_zone_fields.dart';
import 'package:fit_parser/src/fields/power_zone_fields.dart';
import 'package:fit_parser/src/fields/speed_zone_fields.dart';
import 'package:fit_parser/src/fields/sport_fields.dart';
import 'package:fit_parser/src/fields/zones_target_fields.dart';

class SportSettingsFile {
  Map messages = {
    'zones_target': zones_target_fields,
    'sport': sport_fields,
    'hr_zone': hr_zone_fields,
    'speed_zone': speed_zone_fields,
    'cadence_zone': cadence_zone_fields,
    'power_zone': power_zone_fields,
    'met_zone': met_zone_fields,
    'dive_settings': dive_settings_fields,
    'dive_alarm': dive_alarm_fields,
    'dive_gas': dive_gas_fields,
  };
}
