import 'dart:convert';

prettify(map) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  return  encoder.convert(map);
}