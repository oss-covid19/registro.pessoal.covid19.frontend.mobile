import 'package:covid19_pesquisa/model/validacao/item_model.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


///
/// Validacao formulario esqueceu_senha_screen.dart
///
class EsqueceuSenhaModel  with ChangeNotifier{

   ///--- representa valor/erro
   ItemModel _email = ItemModel(null, null);

   //--- getters
   ItemModel get email => _email;

  bool get isValid => _email.valor != null;

   //--- setters
   void changeEmail(String email) {
      if (EmailValidator.validate(email)) {
         _email = ItemModel(email, null);
      } else {
         _email = ItemModel(null, EMAIL_ERRO);
      }
      notifyListeners();
   }

   bool isInicialValor(){
      return _email.valor == null && _email.erro == null;
   }

   ///--- reinicializa valores/estados
   void reset() {
      _email = ItemModel(null, null);
      notifyListeners();
   }
}