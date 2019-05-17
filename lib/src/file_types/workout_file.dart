import 'package:dart/src/fields/exercise_title_fields.dart';
import 'package:dart/src/fields/workout_fields.dart';
import 'package:dart/src/fields/workout_session_fields.dart';
import 'package:dart/src/fields/workout_step_fields.dart';

class WorkoutFile {
  Map messages = {
    'workout': workout_fields,
    'workout_session': workout_session_fields,
    'workout_step': workout_step_fields,
    'exercise_title': exercise_title_fields,
  };
}