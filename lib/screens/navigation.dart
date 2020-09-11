import 'package:flutter/material.dart';

import 'esqueceu_senha_screen.dart';
import 'home_screen.dart';
import 'inscricao_screen.dart';
import 'login_screen.dart';
import 'sumario.dart';

/// constantes de navegação
const String HOME_PAGE = '/home';
const String LOGIN_PAGE = '/login';
const String ESQUECEU_SENHA_PAGE = '/esqueceu_senha';
const String INSCRICAO_PAGE = '/inscricao';
const String SUMARIO_PAGE = '/sumario';

///
/// Rotas nomeadas
///
// ignore: missing_return
Route onGenerateRoute(RouteSettings routeSettings) {
  if (routeSettings.name == ESQUECEU_SENHA_PAGE) {
    return MaterialPageRoute(builder: (context) => EsqueceuSenha());
  }

  if (routeSettings.name == HOME_PAGE) {
    return MaterialPageRoute(builder: (context) => Home());
  }

  if (routeSettings.name == INSCRICAO_PAGE) {
    return MaterialPageRoute(builder: (context) => Inscricao());
  }

  if (routeSettings.name == SUMARIO_PAGE) {
    return MaterialPageRoute(builder: (context) => SumarioScreen());
  }

  if (routeSettings.name == LOGIN_PAGE) {
    return MaterialPageRoute(builder: (context) => Login());
  }
}
