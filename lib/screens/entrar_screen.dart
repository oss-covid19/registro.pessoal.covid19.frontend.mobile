import 'dart:ui';

import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/model/validacao/entrar_model.dart';
import 'package:covid19_pesquisa/model/validacao/esqueceu_senha_model.dart';
import 'package:covid19_pesquisa/screens/esqueceu_senha_screen.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

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
              child: Image.asset('assets/images/redcross.png', width: 110, height: 110, fit: BoxFit.cover),
            ),
            Text('Registro Pessoal: Covid-19', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 24)),
            Container(
              margin: EdgeInsets.all(32),
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
          ],
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Consumer<EntrarModel>(
       builder: (context, model, child) {
      return TextField(
        keyboardType: TextInputType.emailAddress,
        maxLength: 60,
        onChanged: (valor) => {
          model.changeEmail(valor),
        },
        decoration: InputDecoration(
          hintText: 'email',
          labelText: 'Email',
          errorText: model.email.erro,
        ),
      );
    });
  }

  Widget _password(BuildContext context) {
    return Consumer<EntrarModel>(
      builder: (context, model, child) {
        return TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          maxLength: 6,
          onChanged: (String valor) => {
            model.changeSenha(valor),
          },
          decoration: InputDecoration(
            labelText: 'Senha',
            errorText: model.senha.erro,
          ),
        );
      },
    );
  }

  Consumer<T> asConsumer<T>(T validacao, Widget widget) {
    return Consumer<T>(builder: (context, T, child) {
      return widget;
    });
  }

  Widget _manterLogado(BuildContext context) {
    return Row(
      children: <Widget>[
        Consumer<AppModel>(
          builder: (context, model, child) {
            return Checkbox(
              onChanged: (checked) {
                model.isManterLogado = checked;
              },
              value: model.isManterLogado,
            );
          },
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

          EntrarModel entrarModel = EntrarScreen.instanceOf(context);

          if (entrarModel.isValido) {
            AppModel.instanceOf(context).isLogado = true;
            Navigator.pushNamed(context, HOME_SCREEN);
          } else {
            if (entrarModel.isEmailVazio()) {
              print("entrarModel.isEmailVazio(): ${entrarModel.isEmailVazio()}");
              entrarModel.defineMensagemErroEmailVazio();
            }
            if (entrarModel.isSenhaVazio()) {
              print("entrarModel.isSenhaVazio(): ${entrarModel.isSenhaVazio()}");
              entrarModel.defineMensagemErroSenhaVazio();
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
        child: const Icon(Icons.arrow_upward),
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
            EsqueceuSenhaScreen.instanceOf(context).reset();

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

  static EntrarModel instanceOf(BuildContext context) {
    return Provider.of<EntrarModel>(context, listen: false);
  }
}
