import 'dart:ui';

import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/model/validacao/entrar_validacao.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../util/constants.dart';
import 'navigation_screens.dart';

class EntrarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/redcross.png',
                  width: 110, height: 110, fit: BoxFit.cover),
            ),
            Text('Registro Pessoal: Covid-19',
                style: TextStyle(
                    color: Colors.black.withOpacity(1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            Container(
              margin: EdgeInsets.all(32),
              child: Form(
                child: Column(
                  children: <Widget>[
                    _emailField(context),
                    _password(context),
                    _manterLogado(context),
                    _entrar(context),
                    _esqueceuSenha(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 60,
      onChanged: (String valor) => {
        AppModel.instanceOf(context).entrarValidation.changeEmail(valor),
      },
      decoration: InputDecoration(
        hintText: 'email',
        labelText: 'Email',
        errorText: AppModel.instanceOf(context).entrarValidation.email.erro,
      ),
    );
  }

  Widget _password(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      maxLength: 6,
      onChanged: (String valor) => {
        AppModel.instanceOf(context).entrarValidation.changeSenha(valor),
      },
      decoration: InputDecoration(
        labelText: 'Senha',
        errorText: AppModel.instanceOf(context).entrarValidation.senha.erro,
      ),
    );
  }

  Widget _manterLogado(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: (checked) {
            AppModel.instanceOf(context).isManterLogado = checked;
          },
          value: AppModel.instanceOf(context).isManterLogado,
        ),
        Text('Manter-me logado'),
      ],
    );
  }

  Widget _entrar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RaisedButton(
        onPressed: () {
          AppModel.instanceOf(context).isEntrar = true;

          EntrarValidacao validation =
              AppModel.instanceOf(context).entrarValidation;

          if (validation.isValidado()) {
            AppModel.instanceOf(context).isLogado = true;
            Navigator.pushNamed(context, HOME_SCREEN);

          } else {
            if (validation.isEmailVazio()) {
              print("validation.isEmailVazio(): ${validation.isEmailVazio()}");
              validation.defineMensagemErroEmailVazio();
            }
            if (validation.isSenhaVazio()) {
              print("validation.isSenhaVazio(): ${validation.isSenhaVazio()}");
              validation.defineMensagemErroSenhaVazio();
            }
          }
          /*
             TODO:
             ok.1-obter acesso aos valores nos fields
             ok.2-validar os valores
             3-se validos
                3.0 - exibir temporizador
                3.1 - prosseguir POST(json)
                3.2 - receber resposta
                3.3 - esconder temporizador
           */
        },
        child: const Icon(Icons.arrow_forward),
        color: Color(BUTTON_COLOR),
        shape: globalDefineButtonShape(),
      ),
    );
  }

  Widget _esqueceuSenha(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            AppModel.instanceOf(context).isEsqueceuASenha = true;
            AppModel.instanceOf(context).esqueceuSenhaValidacao.reset();

            Navigator.pushNamed(context, ESQUECEU_SENHA_SCREEN);
            
            },
          child: Container(
            child: Text('Esqueci a senha'),
            alignment: Alignment.bottomLeft,
          ),
        ),
        GestureDetector(
          onTap: () {
            AppModel.instanceOf(context).isInscrever = true;


            Navigator.pushNamed(context, INSCRICAO_SCREEN);
          },
          child: Container(
            child: Text('Inscrever'),
            alignment: Alignment.bottomLeft,
          ),
        ),
      ],
    );
  }
}
