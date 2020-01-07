import 'dart:convert';

String prettify(map) {
  var encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(map);
}
