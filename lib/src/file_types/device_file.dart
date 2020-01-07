import 'package:fit_parser/src/fields/capabilities_fields.dart';
import 'package:fit_parser/src/fields/field_capabilities_fields.dart';
import 'package:fit_parser/src/fields/file_capabilities_fields.dart';
import 'package:fit_parser/src/fields/mesg_capabilities_fields.dart';
import 'package:fit_parser/src/fields/slave_device_fields.dart';
import 'package:fit_parser/src/fields/software_fields.dart';

class DeviceFile {
  Map messages = {
    'software': software_fields,
    'slave_device': slave_device_fields,
    'capabilities': capabilities_fields,
    'file_capabilities': file_capabilities_fields,
    'mesg_capabilities': mesg_capabilities_fields,
    'field_capabilities': field_capabilities_fields,
  };
}