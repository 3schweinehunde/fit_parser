import 'package:fit_parser/fit_parser.dart';

void main() {
// var path = './example/assets/activity.fit';
  var path = '/home/stefan/Downloads/activity.fit';
  var fitFile = FitFile(path: path).parse();
  print(fitFile.dataMessages.length.toString() + ' Data Messages found.');
}
