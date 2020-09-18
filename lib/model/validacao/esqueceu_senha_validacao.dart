import 'package:covid19_pesquisa/model/validacao/item_validacao.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


///
/// Validacao formulario esqueceu_senha_screen.dart
///
class EsqueceuSenhaValidacao  with ChangeNotifier{

   ///--- representado o estado atual de valido
   bool _isEmailValidado = false;

   ///--- representa valor/erro
   ItemValidacao _email = ItemValidacao(null, null);

   //--- getters
   ItemValidacao get email => _email;

   //--- setters
   void changeEmail(String email) {
      if (EmailValidator.validate(email)) {
         _email = ItemValidacao(email, null);
         _isEmailValidado = true;
      } else {
         _email = ItemValidacao(email.isEmpty? null: email, EMAIL_ERRO);
         _isEmailValidado = false;
      }

      notifyListeners();
   }

   ///--- retorna estado atual de validacao
   bool isValidado() {
      notifyListeners();
      return _isEmailValidado;
   }

   ///--- valor está vazio
   bool isEmailVazio() {
      return _email.valor == null || _email.valor.isEmpty;
   }

   ///
   /// Utilizado quando usuario tecla ->
   /// E os campo email esta vazio
   ///
   void defineMensagemErroEmailVazio() {
      _email = ItemValidacao(null, EMAIL_VAZIO);
      notifyListeners();
   }

   ///--- reinicializa valores/estados
   void reset() {
      _email = ItemValidacao(null, null);
      _isEmailValidado = false;
      notifyListeners();
   }

   ///
   /// Utilizado quando usuario tecla ->
   /// E os campo email esta com erro
   ///
   void defineMensagemErroEmailErro() {
      _email = ItemValidacao(null, EMAIL_ERRO);
      notifyListeners();
   }


}