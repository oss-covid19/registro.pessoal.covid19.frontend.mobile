import 'package:flutter/material.dart';

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


}

