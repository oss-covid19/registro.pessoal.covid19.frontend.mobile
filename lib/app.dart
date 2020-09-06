import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/screens/navigation.dart';
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
      initialRoute: AppModel.instance().isLogado ? HOME_PAGE : LOGIN_PAGE,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
