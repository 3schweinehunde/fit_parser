import 'package:fit_parser/src/fields/accelerometer_data_fieds.dart';
import 'package:fit_parser/src/fields/aviation_attitude_fields.dart';
import 'package:fit_parser/src/fields/barometer_data_fields.dart';
import 'package:fit_parser/src/fields/camera_event_fields.dart';
import 'package:fit_parser/src/fields/device_info_fields.dart';
import 'package:fit_parser/src/fields/event_fields.dart';
import 'package:fit_parser/src/fields/activity_fields.dart';
import 'package:fit_parser/src/fields/gps_metadata_fields.dart';
import 'package:fit_parser/src/fields/gyroscope_data_fields.dart';
import 'package:fit_parser/src/fields/hrv_fields.dart';
import 'package:fit_parser/src/fields/lap_fields.dart';
import 'package:fit_parser/src/fields/length_fields_fields.dart';
import 'package:fit_parser/src/fields/magnetometer_data_fields.dart';
import 'package:fit_parser/src/fields/nmea_sentence_fields.dart';
import 'package:fit_parser/src/fields/obdii_data_fields.dart';
import 'package:fit_parser/src/fields/one_d_sensor_calibration_fields.dart';
import 'package:fit_parser/src/fields/record_fields.dart';
import 'package:fit_parser/src/fields/session_fields.dart';
import 'package:fit_parser/src/fields/set_fields.dart';
import 'package:fit_parser/src/fields/three_d_sensor_calibration_fields.dart';
import 'package:fit_parser/src/fields/training_file_fields.dart';
import 'package:fit_parser/src/fields/video_fields.dart';
import 'package:fit_parser/src/fields/video_clip_fields.dart';
import 'package:fit_parser/src/fields/video_description_fields.dart';
import 'package:fit_parser/src/fields/video_frame_fields.dart';
import 'package:fit_parser/src/fields/video_title_fields.dart';
import 'package:fit_parser/src/fields/weather_alert_fields.dart';
import 'package:fit_parser/src/fields/weather_conditions_fields.dart';

class ActivityFile {
  Map messages = {
    'activity': activity_fields,
    'device_info': device_info_fields,
    'event': event_fields,
    'hrv': hrv_fields,
    'lap': lap_fields,
    'length': length_fields,
    'record': record_fields,
    'session': session_fields,
    'training_file': training_file_fields,
    'weather_alert': weather_alert_fields,
    'weather_conditions': weather_condition_fields,
    'gps_metadata': gps_metadata_fields,
    'camera_event': camera_event_fields,
    'gyroscope_data': gyroscope_data_fields,
    'accelerometer_data': accelerometer_data_fields,
    'magnetometer_data': magnetometer_data_fields,
    'barometer_data': barometer_data_fields,
    'set': set_fields,
    'video_clip': video_clip_fields,
    'video_description': video_description_fields,
    'video_title': video_title_fields,
    'video': video_fields,
    'aviation_attitude': aviation_attitude_fields,
    'nmea_sentence': nmea_sentence_fields,
    'obdii_data': obdii_data_fields,
    'video_frame': video_frame_fields,
    'one_d_sensor_calibration': one_d_sensor_calibration_fields,
    'three_d_sensor_calibration': three_d_sensor_calibration_fields,
  };
}
