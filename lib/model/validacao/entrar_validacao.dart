import 'package:covid19_pesquisa/model/validacao/item_validacao.dart';
import 'package:covid19_pesquisa/util/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EntrarValidacao with ChangeNotifier {
  ///
  /// Flag final de validade do Form
  ///
  bool _isValidado = false;

  bool _isEmailValidado = false;
  bool _isSenhaValidado = false;

  ItemValidacao _email = ItemValidacao(null, null);
  ItemValidacao _senha = ItemValidacao(null, null);

  //--- getters
  ItemValidacao get email => _email;
  ItemValidacao get senha => _senha;

  //--- setters
  void changeEmail(String email) {
    if (EmailValidator.validate(email)) {
      _email = ItemValidacao(email, null);
      _isEmailValidado = true;
    } else {
      _email = ItemValidacao(email.isEmpty?null:email, EMAIL_ERRO);
      _isEmailValidado = false;
    }

    notifyListeners();
  }

  void changeSenha(String senha) {
    if (senha.isNotEmpty && senha.length >= 4) {
      _senha = ItemValidacao(senha, null);
      _isSenhaValidado = true;
    } else {
      _senha = ItemValidacao(senha.isEmpty?null:senha, SENHA_ERRO);
      _isSenhaValidado = false;
    }
    notifyListeners();
  }

  void reset() {
    _senha = ItemValidacao(null, null);
    _email = ItemValidacao(null, null);
    _isValidado = false;
    _isEmailValidado = false;
    _isSenhaValidado = false;

    notifyListeners();
  }

  bool isValidado() {
    _isValidado = _isEmailValidado && _isSenhaValidado;
    notifyListeners();

    return _isValidado;
  }

  ///
  /// Utilizado quando usuario tecla ->
  /// E os campos estão vazios
  ///
  void defineMensagemErroEmailVazio() {
    _email = ItemValidacao(null, EMAIL_VAZIO);
    notifyListeners();
  }

  ///
  /// Utilizado quando usuario tecla ->
  /// E os campos estão vazios
  ///
  void defineMensagemErroSenhaVazio() {
    _senha = ItemValidacao(null, SENHA_VAZIO);
    notifyListeners();
  }

  bool isEmailVazio() {
    return _email.valor == null || _email.valor.isEmpty;
  }

  bool isSenhaVazio() {
    return _senha.valor == null || _senha.valor.isEmpty;
  }
}
