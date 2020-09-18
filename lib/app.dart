import 'package:covid19_pesquisa/screens/navigation_screens.dart';
import 'package:covid19_pesquisa/util/orientacao_portrait.dart';
import 'package:flutter/material.dart';

///
/// Ponto de entrada do App
///
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    defineOrientacao();

    return MaterialApp(
      initialRoute: ENTRAR_SCREEN,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
