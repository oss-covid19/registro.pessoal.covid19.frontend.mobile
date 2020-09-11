import 'package:flutter/material.dart';

import '../util/constants.dart';
import 'home_screen.dart';
import 'navigation.dart';

class Inscricao extends StatelessWidget {
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
                  Text('Registro Pessoal: Covid-19', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 30)),
                  Text('Bem-vindo', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 30)),
                  Container(
                     margin: EdgeInsets.fromLTRB(32,16,32,0),
                     child: Form(
                        child: Column(
                           children: <Widget>[
                              _emailField(),
                              _password1(),
                              _password2(),
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

   Widget _password1() {
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

   Widget _password2() {
      return TextField(
         keyboardType: TextInputType.visiblePassword,
         obscureText: true,
         maxLength: 6,
         onChanged: (String value) => {},
         decoration: InputDecoration(
            labelText: 'Senha novamente',
         ),
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
               onTap: () => Navigator.pushNamed(context, LOGIN_PAGE),
               child: Container(
                  child: Text('Já inscrito, entrar'),
                  alignment: Alignment.bottomLeft,
               ),
            ),
         ],
      );
   }
}

