import 'package:dart/dart.dart';

main() {
  String path = "./example/assets/Activity.fit";
  print(FitFile(path: path).metadata.toString());


  print(FitMessage().messages);
}

