import 'package:fit_parser/fit_parser.dart';

void main() {
// var path = './example/assets/with_stryd.fit';
  var path = '/home/stefan/Downloads/Aus_dem_Kanal_dampft_es_.fit';
  var fitFile = FitFile(path: path).parse();
  print(fitFile.dataMessages.length.toString() + ' Data Messages found.');
}
