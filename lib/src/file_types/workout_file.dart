import 'package:fit_parser/src/fields/exercise_title_fields.dart';
import 'package:fit_parser/src/fields/workout_fields.dart';
import 'package:fit_parser/src/fields/workout_session_fields.dart';
import 'package:fit_parser/src/fields/workout_step_fields.dart';

class WorkoutFile {
  Map messages = {
    'workout': workoutFields,
    'workout_session': workoutSessionFields,
    'workout_step': workoutStepFields,
    'exercise_title': exerciseTitleFields,
  };
}
