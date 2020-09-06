import 'package:flutter/services.dart';


void defineOrientacao() {
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
   ]);
}