import 'package:fit_parser/src/fields/ant_channel_id_fields.dart';
import 'package:fit_parser/src/fields/ant_rx_fields.dart';
import 'package:fit_parser/src/fields/ant_tx_fields.dart';
import 'package:fit_parser/src/fields/developer_data_id_fields.dart';
import 'package:fit_parser/src/fields/dive_summary_fields.dart';
import 'package:fit_parser/src/fields/exd_data_concept_configuration_fields.dart';
import 'package:fit_parser/src/fields/exd_data_field_configuration_fields.dart';
import 'package:fit_parser/src/fields/exd_screen_configuration_fields.dart';
import 'package:fit_parser/src/fields/field_description_fields.dart';
import 'package:fit_parser/src/fields/memo_glob_fields.dart';

class OtherFile {
  Map messages = {
    'memo_glob': memoGlobFields,
    'ant_channel_id': antChannelIdFields,
    'ant_rx': antRxFields,
    'ant_tx': antTxFields,
    'exd_screen_configuration': exdScreenConfigurationFields,
    'exd_data_field_configuration': exdDataFieldConfigurationFields,
    'exd_data_concept_configuration': exdDataConceptConfigurationFields,
    'field_description': fieldDescriptionFields,
    'developer_data_id': developerDataIdFields,
    'dive_summary': diveSummaryFields,
  };
}
