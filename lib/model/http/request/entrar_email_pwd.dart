import 'dart:convert';

class EmailPassword{
   final String email;
   final String password;

   EmailPassword({this.email, this.password});

   factory EmailPassword.fromJson(Map<String, dynamic> json){
      return EmailPassword(
         email: json['email'],
         password: json['password']
      );
   }
}