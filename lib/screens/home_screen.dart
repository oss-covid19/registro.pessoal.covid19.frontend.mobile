import 'package:covid19_pesquisa/screens/navigation.dart';
import 'package:flutter/material.dart';

import '../util/constants.dart';

///----------------------------------------------------------------------------

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialogoSaida(context),
      child: MaterialApp(
        title: APP_TITLE,
        theme: ThemeData(
          primaryColor: Color(0xffc4dff6),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(APP_TITLE),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Sumário',
                onPressed: () {
                  Navigator.pushNamed(context, SUMARIO_PAGE);
                },
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Container>[
              Container(
                child: Image.asset('assets/images/redcross.png',
                    width: 110, height: 110, fit: BoxFit.cover),
              ),
              Container(
                //--- Texto Pergunta
                child: Text(
                  PERGUNTA,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              //--- Botoes
              Container(
                margin: EdgeInsets.fromLTRB(80, 20, 70, 0),
                child: Column(
                  children: <Widget>[
                    buildButtonTheme(BUTTON0_TEXT, context),
                    buildButtonTheme(BUTTON1_TEXT, context),
                    buildButtonTheme(BUTTON2_TEXT, context),
                    buildButtonTheme(BUTTON3_TEXT, context),
                    buildButtonTheme(BUTTON4_TEXT, context),
                  ],
                ),
              ),
              //--- Texto bottom
              Container(
                margin: EdgeInsets.fromLTRB(16, 200, 0, 0),
                child: Text(
                  TEXT_BOTTOM,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///----------------------------------------------------------------------------

  ///---Cria botôes customizados em largura, cor, estilo de Texto e ação a manipular
  ButtonTheme buildButtonTheme(String txtRaisedButton, BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        shape: defineButtonShape(),
        onPressed: () {
          apresentarDialogo(txtRaisedButton, context);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(txtRaisedButton,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.4), fontSize: 16)),
        ),
        color: Color(BUTTON_COLOR),
      ),
    );
  }

  ///----------------------------------------------------------------------------

  ///--- Exibe dialogo para o evento Pressed
  apresentarDialogo(txtRaisedButton, context) {
    ///--- definição botões do Alert
    Widget btnCancelar = FlatButton(
      child: Text('Cancela'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget btnConfirmar = FlatButton(
      child: Text('Confirma'),
      onPressed: () {
        Navigator.popAndPushNamed(context, SUMARIO_PAGE);
      },
    );

    ///--- definição Alert
    AlertDialog alertDialog = AlertDialog(
      title: Text('Sua Resposta'),
      content: Text(txtRaisedButton),
      actions: [btnCancelar, btnConfirmar],
      elevation: 24,
    );

    ///--- exibir AlertDialog
    showDialog(
      context: context,
      builder: (_) => alertDialog,
      barrierDismissible: false,
    );
  }

  ///--- define aspectos dos botões: cor da borda,
  static ShapeBorder defineButtonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
      //side: BorderSide(color: Colors.red)
    );
  }
}

ShapeBorder globalDefineButtonShape() {
  return Home.defineButtonShape();
}

Future<bool> showDialogoSaida(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(''),
      content: Text('Você quer realmente sair?'),
      actions: [
        FlatButton(
          child: Text('Sim'),
          onPressed: () => Navigator.popAndPushNamed(context, LOGIN_PAGE),
          //onPressed: () => SystemNavigator.pop(),
        ),
        FlatButton(
          child: Text('Não'),
          onPressed: () => Navigator.pop(c, false),
        ),
      ],
    ),
  );
}

///----------------------------------------------------------------------------
