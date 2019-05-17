import 'package:dart/src/fields/capabilities_fields.dart';
import 'package:dart/src/fields/field_capabilities_fields.dart';
import 'package:dart/src/fields/file_capabilities_fields.dart';
import 'package:dart/src/fields/mesg_capabilities_fields.dart';
import 'package:dart/src/fields/slave_device_fields.dart';
import 'package:dart/src/fields/software_fields.dart';

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