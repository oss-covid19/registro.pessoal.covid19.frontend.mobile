import 'package:flutter/material.dart';

import '../util/constants.dart';
import 'home_screen.dart';
import 'navigation.dart';

class EsqueceuSenha extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Registro Pessoal: Covid-19', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 30)),
            Text('Informe seu email', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 30)),
            Container(
              margin: EdgeInsets.all(32),
              child: Form(
                child: Column(
                  children: <Widget>[
                    _emailField(),
                    //_password(),
                    //_manterLogado(),
                    //_entrar(context),
                    //_esqueceuSenha(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 60,
      onChanged: (String value) => {},
      decoration: InputDecoration(
        hintText: 'email',
        labelText: 'Email',
      ),
    );
  }

  Widget _password() {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      maxLength: 6,
      onChanged: (String value) => {},
      decoration: InputDecoration(
        labelText: 'Senha',
      ),
    );
  }

  Widget _manterLogado() {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: (checked) => {},
          value: false,
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
          Navigator.pushNamed(context, HOME_PAGE);
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
          onTap: () => Navigator.pushNamed(context, ESQUECEU_SENHA_PAGE),
          child: Container(
            child: Text('Esqueci a senha'),
            alignment: Alignment.bottomLeft,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, INSCRICAO_PAGE),
          child: Container(
            child: Text('Inscrever'),
            alignment: Alignment.bottomLeft,
          ),
        ),
      ],
    );
  }
}

