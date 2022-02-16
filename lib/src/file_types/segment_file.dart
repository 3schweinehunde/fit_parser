import 'package:fit_parser/src/fields/segment_id_fields.dart';
import 'package:fit_parser/src/fields/segment_lap_fields.dart';
import 'package:fit_parser/src/fields/segment_leaderboard_entry_fields.dart';
import 'package:fit_parser/src/fields/segment_point_fields.dart';

class SegmentFile {
  Map messages = {
    'segment_id': segmentIdFields,
    'segment_leaderboard_entry': segmentLeaderboardEntryFields,
    'segment_point': segmentPointFields,
    'segment_lap': segmentLapFields,
  };
}
