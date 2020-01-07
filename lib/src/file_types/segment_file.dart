import 'package:fit_parser/src/fields/segment_id_fields.dart';
import 'package:fit_parser/src/fields/segment_lap_fields.dart';
import 'package:fit_parser/src/fields/segment_leaderboard_entry_fields.dart';
import 'package:fit_parser/src/fields/segment_point_fields.dart';

class SegmentFile {
  Map messages = {
    'segment_id': segment_id_fields,
    'segment_leaderboard_entry': segment_leaderboard_entry_fields,
    'segment_point': segment_point_fields,
    'segment_lap': segment_lap_fields,
  };
}