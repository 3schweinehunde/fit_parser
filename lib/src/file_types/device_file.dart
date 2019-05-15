import 'package:dart/src/fields/capabilities.dart';
import 'package:dart/src/fields/field_capabilities.dart';
import 'package:dart/src/fields/file_capabilities.dart';
import 'package:dart/src/fields/mesg_capabilities.dart';
import 'package:dart/src/fields/slave_device.dart';
import 'package:dart/src/fields/software.dart';

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