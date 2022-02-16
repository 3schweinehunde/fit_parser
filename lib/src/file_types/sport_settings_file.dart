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
    'zones_target': zonesTargetFields,
    'sport': sportFields,
    'hr_zone': hrZoneFields,
    'speed_zone': speedZoneFields,
    'cadence_zone': cadenceZoneFields,
    'power_zone': powerZoneFields,
    'met_zone': metZoneFields,
    'dive_settings': diveSettingsFields,
    'dive_alarm': diveAlarmFields,
    'dive_gas': diveGasFields,
  };
}
