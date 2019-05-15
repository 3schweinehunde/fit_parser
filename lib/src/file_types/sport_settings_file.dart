import 'package:dart/src/fields/cadence_zone.dart';
import 'package:dart/src/fields/hr_zone.dart';
import 'package:dart/src/fields/speed_zone.dart';
import 'package:dart/src/fields/sport.dart';
import 'package:dart/src/fields/zones_target.dart';

class SportSettingsFile {
  Map messages = {
    'zones_target': zones_target_fields,
    'sport': sport_fields,
    'hr_zone': hr_zone_fields,
    'speed_zone': speed_zone_fields,
    'cadence_zone': cadence_zone_fields,
  };
}