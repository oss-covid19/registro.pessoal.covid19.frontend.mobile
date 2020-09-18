import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/model/validacao/esqueceu_senha_validacao.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:flutter/material.dart';

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
                child: Form(
                  child: Column(
                    children: <Widget>[
                      _emailField(context),
                      _enviar(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 60,
      onChanged: (String valor) => {
        AppModel.instanceOf(context).esqueceuSenhaValidacao.changeEmail(valor),
      },
      decoration: InputDecoration(
        hintText: 'email',
        labelText: 'Email',
        errorText: AppModel.instanceOf(context).esqueceuSenhaValidacao.email.erro,
      ),
    );
  }

  Widget _enviar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RaisedButton(
        onPressed: () {
          EsqueceuSenhaValidacao validacao = AppModel.instanceOf(context).esqueceuSenhaValidacao;

          bool isValidado = validacao.isValidado();

          print("EsqueceuSenhaValidation: $isValidado");
          print("email.valor: ${validacao.email.valor}");
          print("email.erro: ${validacao.email.erro}");

          if (isValidado) {
            //--- TODO: enviar request para o Serviço: request sync, pois vai notificar de sucesso via

            bool isEnviadoComSucesso = false;


            SnackBar snackBar = SnackBar(
              content: Text("Verifique seu email, foi enviado uma senha temporária", style: TextStyle(color: Colors.black, fontSize: 16)),
              backgroundColor: Color(BUTTON_COLOR),
              elevation: 1,
              duration: Duration(milliseconds: 6000),
            );

            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(snackBar);

            //Navigator.pushNamed(context, HOME_PAGE);
          } else {
            if (validacao.isEmailVazio()) {
              print("validacao.isEmailVazio(): ${validacao.isEmailVazio()}");
              validacao.defineMensagemErroEmailVazio();
            } else {
              validacao.defineMensagemErroEmailErro();
            }
            print("---------------------------------------------------------");
            print("email.valor: ${validacao.email.valor}");
            print("email.erro: ${validacao.email.erro}");
          }
        },
        child: const Icon(Icons.arrow_forward),
        color: Color(BUTTON_COLOR),
        shape: globalDefineButtonShape(),
      ),
    );
  }
}
