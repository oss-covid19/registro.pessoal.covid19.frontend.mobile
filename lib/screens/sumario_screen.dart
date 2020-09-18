import 'package:flutter/material.dart';
import '../util/constants.dart';
import '../model/app_model.dart';

///----------------------------------------------------------------------------

void main() {
  runApp(Tester());
}

///----------------------------------------------------------------------------

class Tester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SumarioScreen(),
    );
  }
}

///----------------------------------------------------------------------------

class SumarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              //height: 28,
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                'Meu Registro:',
                style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            Container(
              //height: 102,
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      createText('Não peguei covid-19'),
                      createText('Não sei se peguei covid-19'),
                      createText('Peguei covid-19 faz < 14 dias'),
                      createText('Peguei covid-19 faz > 14 dias'),
                      createText('Curado de covid-19'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      createText('99/99/9999 99:99hs'),
                      createText('99/99/9999 99:99hs'),
                      createText('99/99/9999 99:99hs'),
                      createText('99/99/9999 99:99hs'),
                      createText('99/99/9999 99:99hs'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 21,
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: createDivider(),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    'Sumário:',
                    style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 3, 0, 0),
                  child: createText('99/99/9999 99:99hs'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      createText('Não pegaram covid-19:'),
                      createText('Não sabe se pegaram covid-19:'),
                      createText('Pegaram covid-19 faz < 14 dias:'),
                      createText('Pegaram covid-19 faz > 14 dias:'),
                      createText('Curados de covid-19:'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      createText('Logado: ${AppModel.instanceOf(context).isLogado}'),
                      createText('Entrar: ${AppModel.instanceOf(context).isEntrar}'),
                      createText('Esqueci a Senha: ${AppModel.instanceOf(context).isEsqueceuASenha}'),
                      createText('Inscrever: ${AppModel.instanceOf(context).isInscrever}'),
                      createText('Manter Logado: ${AppModel.instanceOf(context).isManterLogado}'),
                      //createText('1'),
                      //createText('11'),
                      //createText('111'),
                      //createText('1.111'),
                      createText('111.111'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 40,
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Registros Pessoais:',
                        style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      createText(
                        '11',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 21,
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: createDivider(),
            ),
            Container(
              //height: 20,
              margin: EdgeInsets.fromLTRB(16, 40, 0, 0),
              child: Text('Projeto Open Source: https://github.com/oss-covid19', style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Cria um divisor entre as seções
  ///
  createDivider() {
    return Divider(
      color: Colors.black.withOpacity(0.2),
      thickness: 3,
      height: 3,
    );
  }

  createText(String text) {
    return Align(
      child: Text(text, textAlign: TextAlign.right, style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14)),
    );
  }
}
