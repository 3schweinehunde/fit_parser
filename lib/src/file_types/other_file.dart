import 'package:dart/src/fields/ant_channel_id_fields.dart';
import 'package:dart/src/fields/ant_rx_fields.dart';
import 'package:dart/src/fields/ant_tx_fields.dart';
import 'package:dart/src/fields/developer_data_id_fields.dart';
import 'package:dart/src/fields/dive_summary_fields.dart';
import 'package:dart/src/fields/exd_data_concept_configuration_fields.dart';
import 'package:dart/src/fields/exd_data_field_configuration_fields.dart';
import 'package:dart/src/fields/exd_screen_configuration_fields.dart';
import 'package:dart/src/fields/field_description_fields.dart';
import 'package:dart/src/fields/memo_glob_fields.dart';

class OtherFile {
  Map messages = {
    'memo_glob': memo_glob_fields,
    'ant_channel_id': ant_channel_id_fields,
    'ant_rx': ant_rx_fields,
    'ant_tx': ant_tx_fields,
    'exd_screen_configuration': exd_screen_configuration_fields,
    'exd_data_field_configuration': exd_data_field_configuration_fields,
    'exd_data_concept_configuration': exd_data_concept_configuration_fields,
    'field_description': field_description_fields,
    'developer_data_id': developer_data_id_fields,
    'dive_summary': dive_summary_fields,
  };
}