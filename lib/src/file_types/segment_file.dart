import 'package:dart/src/fields/segment_id.dart';
import 'package:dart/src/fields/segment_lap.dart';
import 'package:dart/src/fields/segment_leaderboard_entry.dart';
import 'package:dart/src/fields/segment_point.dart';

class SegmentFile {
  Map messages = {
    'segment_id': segment_id_fields,
    'segment_leaderboard_entry': segment_leaderboard_entry_fields,
    'segment_point': segment_point_fields,
    'segment_lap': segment_lap_fields,
  };
}