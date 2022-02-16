import 'package:fit_parser/src/fields/course_fields.dart';
import 'package:fit_parser/src/fields/course_point_fields.dart';

class CourseFile {
  Map messages = {
    'course': courseFields,
    'course_point': coursePointFields,
  };
}
