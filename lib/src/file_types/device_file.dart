import 'package:fit_parser/src/fields/capabilities_fields.dart';
import 'package:fit_parser/src/fields/field_capabilities_fields.dart';
import 'package:fit_parser/src/fields/file_capabilities_fields.dart';
import 'package:fit_parser/src/fields/mesg_capabilities_fields.dart';
import 'package:fit_parser/src/fields/slave_device_fields.dart';
import 'package:fit_parser/src/fields/software_fields.dart';

class DeviceFile {
  Map messages = {
    'software': softwareFields,
    'slave_device': slaveDeviceFields,
    'capabilities': capabilitiesFields,
    'file_capabilities': fileCapabilitiesFields,
    'mesg_capabilities': mesgCapabilitiesFields,
    'field_capabilities': fieldCapabilitiesFields,
  };
}
