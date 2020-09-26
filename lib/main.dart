import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/model/validacao/entrar_model.dart';
import 'package:covid19_pesquisa/model/validacao/esqueceu_senha_model.dart';
import 'package:covid19_pesquisa/model/validacao/inscricao_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppModel(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => EntrarModel(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => EsqueceuSenhaModel(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => InscricaoModel(),
            lazy: false,
          ),

        ],
        child: App(),
      ),
    );
