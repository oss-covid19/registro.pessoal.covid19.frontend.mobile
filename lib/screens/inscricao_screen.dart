import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/model/validacao/inscricao_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/constants.dart';
import 'navigation_screens.dart';

class InscricaoScreen extends StatelessWidget {
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
                  Text('Bem-vindo', style: TextStyle(color: Colors.black.withOpacity(1), fontWeight: FontWeight.bold, fontSize: 24)),
                  Container(
                     margin: EdgeInsets.fromLTRB(32,16,32,0),
                     child: Column(
                        children: <Widget>[
                           _emailField(context),
                           _password1(context),
                           _password2(context),
                           _enviar(context),
                           _jaInscrito(context),
                        ],
                     ),
                  ),
               ],
            ),
         ),
      );
   }

   Widget _emailField(BuildContext context) {
      return Consumer<InscricaoModel>(
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

   Widget _password1(BuildContext context) {
      return Consumer<InscricaoModel>(
         builder: (context, model, child) {
            return TextField(
               keyboardType: TextInputType.visiblePassword,
               obscureText: true,
               maxLength: 6,
               onChanged: (String valor) => {
                  model.changeSenha1(valor),
               },
               decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: model.senha1.erro,
               ),
            );
         },
      );
   }

   Widget _password2(BuildContext context) {
      return Consumer<InscricaoModel>(
         builder: (context, model, child) {
            return TextField(
               keyboardType: TextInputType.visiblePassword,
               obscureText: true,
               maxLength: 6,
               onChanged: (String valor) => {
                  model.changeSenha2(valor),
               },
               decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: model.senha2.erro,
               ),
            );
         },
      );
   }

   Widget _enviar(BuildContext context) {
      return Padding(
         padding: const EdgeInsets.all(16),
         child: RaisedButton(
            onPressed: () {
               InscricaoModel inscricaoModel = InscricaoScreen.instanceOf(context);

               if (inscricaoModel.isValido && inscricaoModel.isSenhasIguais()) {
                  AppModel.instanceOf(context).isInscrever = true;
                  print("inscricaoModel.isSenhasIguais(): ${inscricaoModel.isSenhasIguais()}");


                  Navigator.pushNamed(context, HOME_SCREEN);
               } else {
                  if(!inscricaoModel.isSenhasIguais()){
                     print("!inscricaoModel.isSenhasIguais(): ${!inscricaoModel.isSenhasIguais()}");
                     inscricaoModel.defineMensagemErroSenhasNaoIguais();
                  }

                  if (inscricaoModel.isEmailVazio()) {
                     print("inscricaoModel.isEmailVazio(): ${inscricaoModel.isEmailVazio()}");
                     inscricaoModel.defineMensagemErroEmailVazio();
                  }

                  if (inscricaoModel.isSenha1Vazio()) {
                     print("inscricaoModel.isSenha1Vazio(): ${inscricaoModel.isSenha1Vazio()}");
                     inscricaoModel.defineMensagemErroSenha1Vazio();
                  }

                  if (inscricaoModel.isSenha2Vazio()) {
                     print("inscricaoModel.isSenha2Vazio(): ${inscricaoModel.isSenha2Vazio()}");
                     inscricaoModel.defineMensagemErroSenha2Vazio();
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

   Widget _jaInscrito(BuildContext context) {
      return Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
            GestureDetector(
               onTap: () => Navigator.pushNamed(context, ENTRAR_SCREEN),
               child: Container(
                  child: Text('Já inscrito, entrar'),
                  alignment: Alignment.bottomLeft,
               ),
            ),
         ],
      );
   }

   static InscricaoModel instanceOf(BuildContext context) {
      return Provider.of<InscricaoModel>(context, listen: false);
   }
}

