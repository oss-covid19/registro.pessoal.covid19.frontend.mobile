import 'package:covid19_pesquisa/model/app_model.dart';
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

          //outros Providers
        ],
        child: App(),
      ),
    );
