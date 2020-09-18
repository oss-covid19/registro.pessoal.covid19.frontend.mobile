import 'package:flutter/material.dart';

import 'esqueceu_senha_screen.dart';
import 'home_screen.dart';
import 'inscricao_screen.dart';
import 'entrar_screen.dart';
import 'sumario_screen.dart';

/// constantes de navegação
const String HOME_SCREEN = '/home';
const String ENTRAR_SCREEN = '/login';
const String ESQUECEU_SENHA_SCREEN = '/esqueceu_senha';
const String INSCRICAO_SCREEN = '/inscricao';
const String SUMARIO_SCREEN = '/sumario';

///
/// Rotas nomeadas
///
// ignore: missing_return
Route onGenerateRoute(RouteSettings routeSettings) {
  if (routeSettings.name == ESQUECEU_SENHA_SCREEN) {
    return MaterialPageRoute(builder: (context) => EsqueceuSenhaScreen());
  }

  if (routeSettings.name == HOME_SCREEN) {
    return MaterialPageRoute(builder: (context) => HomeScreen());
  }

  if (routeSettings.name == INSCRICAO_SCREEN) {
    return MaterialPageRoute(builder: (context) => InscricaoScreen());
  }

  if (routeSettings.name == SUMARIO_SCREEN) {
    return MaterialPageRoute(builder: (context) => SumarioScreen());
  }

  if (routeSettings.name == ENTRAR_SCREEN) {
    return MaterialPageRoute(builder: (context) => EntrarScreen());
  }
}
