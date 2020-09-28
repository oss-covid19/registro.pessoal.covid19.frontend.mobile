import 'dart:convert';

import 'package:covid19_pesquisa/model/http/request/entrar_email_pwd.dart';
import 'package:http/http.dart' as http;

///
/// Faz chamadas remotas via REST a API interna
///

class ApiClient{
   void main(){
      Future<http.Response> futureRes = postEntrar("http://localhost:8080/registro-pessoal-covid19", EmailPassword(
         email: 'milton.vincenttis@gmail.com',
         password: '1234'));

      futureRes.then((value) => print(value));


   }


   ///
   /// Recebe uma URL do servico e um objeto UserPassword pra enviar
   ///
   Future<http.Response> postEntrar(String service, EmailPassword credenciais) async {
      return http.post(
         service,
         headers:  <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
         },
         body: jsonEncode(<String, String>{
         'email': credenciais.email,
         'password': credenciais.password
         }),
      );
   }

   void postInscricao(){}
   void postEsqueceuASenha(){}


}