import 'package:flutter/foundation.dart';

class TesterModel with ChangeNotifier {
  String _tester = 'texto from TesterModel';

  String get tester => _tester;
  void set tester(String tester) => _tester = tester;

  void changeTester(String value) {
    _tester = value;

    notifyListeners();
  }
}
