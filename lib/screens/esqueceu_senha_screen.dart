import 'package:covid19_pesquisa/model/validacao/esqueceu_senha_model.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EsqueceuSenhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Registro Pessoal: Covid-19', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 24)),
              Text('Informe seu email', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 24)),
              Container(
                margin: EdgeInsets.all(32),
                child: Column(
                  children: <Widget>[
                    _emailField(context),
                    _enviar(context),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _emailField(BuildContext context) {
    return Consumer<EsqueceuSenhaModel>(
       builder: (context, validacao, child) {
      return TextField(
        keyboardType: TextInputType.emailAddress,
        maxLength: 60,
        onChanged: (valor) => {
          validacao.changeEmail(valor),
        },
        decoration: InputDecoration(
          hintText: 'email',
          labelText: 'Email',
          errorText: validacao.email.erro,
        ),
      );
    });
  }

  Widget _enviar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RaisedButton(
        onPressed: () {
          if (instanceOf(context).isValid) {
            //--- TODO: enviar request para o Serviço: request sync, pois vai notificar de sucesso via

            SnackBar snackBar = SnackBar(
              content: Text("Por favor, verifique seu email. Enviamos uma senha temporária", style: TextStyle(color: Colors.black, fontSize: 16)),
              backgroundColor: Color(BUTTON_COLOR),
              elevation: 1,
              duration: Duration(milliseconds: 6000),
            );

            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(snackBar);

            //Navigator.pushNamed(context, HOME_PAGE);
          } else if( instanceOf(context).isInicialValor()){

            //--- caso de onPressed sem entrar valor algum
            print('valorInicial: ${instanceOf(context).isInicialValor()}');
            instanceOf(context).changeEmail('');
          }
        },
        child: const Icon(Icons.arrow_forward),
        color: Color(BUTTON_COLOR),
        shape: globalDefineButtonShape(),
      ),
    );
  }

  static EsqueceuSenhaModel instanceOf(BuildContext context) {
    return Provider.of<EsqueceuSenhaModel>(context, listen: false);
  }
}
