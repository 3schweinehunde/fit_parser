import 'package:fit_parser/fit_parser.dart';
import 'dart:convert';
import 'package:pretty_print_json/pretty_print_json.dart';

void main(List<String> arguments) async {
  var fitFile = FitFile(path: arguments[0]).parse();
  print(json
      .encode(fitFile.dataMessages
          .map((dataMessage) => dataMessage.toMap())
          .toList())
      .toPrettyJson);
}
