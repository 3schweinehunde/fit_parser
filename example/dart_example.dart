import 'package:fit_parser/fit_parser.dart';

void main() {
  var path = './example/assets/with_stryd.fit';
// var path = '/home/stefan/Downloads/with_stryd.fit';
  var fitFile = FitFile(path: path).parse();
  print('${fitFile.dataMessages.length} Data Messages found.');
}
