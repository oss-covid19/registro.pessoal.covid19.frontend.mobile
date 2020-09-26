import 'package:flutter/material.dart';
import 'package:covid19_pesquisa/model/validacao/item_model.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:email_validator/email_validator.dart';

///
/// Validacao formulario inscricao_screen.dart
///
class InscricaoModel with ChangeNotifier {
  ///
  /// Flag final de validade do Form
  ///
  bool _isValidado = false;

  bool _isEmailValidado = false;
  bool _isSenha1Validado = false;
  bool _isSenha2Validado = false;
  bool _isSenhasIguais = false;

  ItemModel _email = ItemModel(null, null);
  ItemModel _senha1 = ItemModel(null, null);
  ItemModel _senha2 = ItemModel(null, null);

  //--- getters
  ItemModel get email => _email;
  ItemModel get senha1 => _senha1;
  ItemModel get senha2 => _senha2;

  //--- setters
  void changeEmail(String email) {
    if (EmailValidator.validate(email)) {
      _email = ItemModel(email, null);
      _isEmailValidado = true;
    } else {
      _email = ItemModel(null, EMAIL_ERRO);
      _isEmailValidado = false;
    }

    notifyListeners();
  }

  void changeSenha1(String senha) {
    if (senha != null && senha.isNotEmpty && senha.length >= 4) {
      _senha1 = ItemModel(senha, null);
      _isSenha1Validado = true;
    } else {
      _senha1 = ItemModel(null, SENHA_ERRO);
      _isSenha1Validado = false;
    }
    notifyListeners();
  }

  void changeSenha2(String senha) {
    if (senha != null && senha.isNotEmpty && senha.length >= 4) {
      _senha2 = ItemModel(senha, null);
      _isSenha2Validado = true;
    } else {
      _senha2 = ItemModel(null, SENHA_ERRO);
      _isSenha2Validado = false;
    }
    notifyListeners();
  }

  void reset() {
    _senha1 = ItemModel(null, null);
    _senha2 = ItemModel(null, null);
    _email = ItemModel(null, null);
    _isValidado = false;
    _isEmailValidado = false;
    _isSenha1Validado = false;
    _isSenha2Validado = false;
    _isSenhasIguais = false;

    notifyListeners();
  }

  bool get isValido {
    _isValidado = _isEmailValidado && _isSenha1Validado && _isSenha2Validado && _isSenhasIguais;
    notifyListeners();

    return _isValidado;
  }

  ///
  /// Utilizado quando usuario tecla ->
  /// E os campos estão vazios
  ///
  void defineMensagemErroEmailVazio() {
    _email = ItemModel(null, EMAIL_VAZIO);
    notifyListeners();
  }

  ///
  /// Utilizado quando usuario tecla ->
  /// E os campos estão vazios
  ///
  void defineMensagemErroSenha1Vazio() {
    _senha1 = ItemModel(null, SENHA_VAZIO);
    notifyListeners();
  }

  ///
  /// Utilizado quando usuario tecla ->
  /// E os campos estão vazios
  ///
  void defineMensagemErroSenha2Vazio() {
     _senha2 = ItemModel(null, SENHA_VAZIO);
     notifyListeners();
  }


  bool isEmailVazio() {
    return _email.valor == null || _email.valor.isEmpty;
  }

  bool isSenha1Vazio() {
    return _senha1.valor == null || _senha1.valor.isEmpty;
  }

  bool isSenha2Vazio() {
     return _senha2.valor == null || _senha2.valor.isEmpty;
  }
}
