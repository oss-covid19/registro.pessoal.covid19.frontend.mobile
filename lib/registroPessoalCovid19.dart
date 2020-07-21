import 'package:flutter/material.dart';

const String APP_TITLE = "Registro Pessoal: covid-19";

///----------------------------------------------------------------------------

void main() {
  runApp(RegistroPessoalCovid19App());
}

///----------------------------------------------------------------------------

class RegistroPessoalCovid19App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tela1(),
    );
  }
}

///----------------------------------------------------------------------------

class Tela1 extends StatelessWidget {
  static const int BUTTON_COLOR = 0xffc4dff6;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    const int BGCOLOR = 0xffd7d7d8;
    const String PERGUNTA = 'Como está minha saúde?';
    const String BUTTON0_TEXT = 'Não peguei covid-19';
    const String BUTTON1_TEXT = 'Não sei se peguei covid-19';
    const String BUTTON2_TEXT = 'Peguei covid-19 faz < 14 dias';
    const String BUTTON3_TEXT = 'Peguei covid-19 faz > 14 dias';
    const String BUTTON4_TEXT = 'Estou curado de covid-19';
    const String TEXT_BOTTOM = 'A informação é anônima nenhum dado a mais é obtido ou armazenado. Esse App não tem vínculo com o Ministério da Saúde.';

    return Scaffold(
      backgroundColor: Color(BGCOLOR),
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: Column(
        children: <Container>[
          Container(
            //---padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Image.asset('assets/images/redcross.png', width: 110, height: 110, fit: BoxFit.cover),
          ),
          Container(
            //--- Texto Pergunta
            child: Text(
              PERGUNTA,
              style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          //--- Botoes
          Container(
            margin: EdgeInsets.fromLTRB(60, 5, 60, 20),
            child: Column(
              children: <Widget>[
                buildButtonTheme(BUTTON0_TEXT),
                buildButtonTheme(BUTTON1_TEXT),
                buildButtonTheme(BUTTON2_TEXT),
                buildButtonTheme(BUTTON3_TEXT),
                buildButtonTheme(BUTTON4_TEXT),
              ],
            ),
          ),
          //--- Texto bottom
          Container(
            margin: EdgeInsets.all(12.0),
            child: Text(
              TEXT_BOTTOM,
              style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  ///----------------------------------------------------------------------------

  ///---Cria botôes customizados em largura, cor, estilo de Texto,e ação a manipular
  ButtonTheme buildButtonTheme(String txtRaisedButton) {
    //BuildContext context = navigatorKey.currentState.overlay.context;

    return ButtonTheme(
      minWidth: 250.0,
      child: RaisedButton(
        onPressed: () {
          apresentarDialogo(context, txtRaisedButton);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(txtRaisedButton, textAlign: TextAlign.left, style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 18)),
        ),
        color: Color(BUTTON_COLOR),
      ),
    );
  }

  ///----------------------------------------------------------------------------

  ///--- Exibe dialogo para o evento Pressed
  apresentarDialogo(context, txtRaisedButton) {
    ///--- definição botões do Alert
    Widget btnCancelar = FlatButton(
      child: Text('Cancelar'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget btnConfirmo = FlatButton(
      child: Text('Confirmar'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    ///--- definição Alert
    AlertDialog alertDialog = AlertDialog(
      title: Text('Resposta'),
      content: Text(txtRaisedButton),
      actions: [btnCancelar, btnConfirmo],
    );

    ///--- exibir AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}

///----------------------------------------------------------------------------