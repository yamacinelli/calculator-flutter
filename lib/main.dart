import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'calculator.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return CupertinoApp(debugShowCheckedModeBanner: false, home: Calculator());
  }
}