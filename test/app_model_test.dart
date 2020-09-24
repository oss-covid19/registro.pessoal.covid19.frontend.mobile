import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/model/validacao/entrar_model.dart';
import 'package:covid19_pesquisa/util/conexao.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TESTA ENTRAR:VALIDATION', () {
    final EntrarModel estado = EntrarModel();

    test('Testa estado inicial email == null', () {
      //--- testa estado inicial == false
      expect(estado.email.valor, null);
    });

    test('Testa email dever valido =>  erro == null', () {
      estado.changeEmail("milton.vincenttis@gmail.com");
      expect(estado.email.erro, null);
    });

    test(
        'Testa 1o: email válido, depois trocado para invalido:  email dever invalido =>  erro != null',
        () {
      estado.changeEmail("milton.vincenttis@gmail.com");
      expect(estado.email.erro, null);

      estado.changeEmail("aaaa");
      expect(estado.email.erro, isNotNull);
    });

    test( 'Testa a lib EmailValidator', () {
      expect(EmailValidator.validate("milton.vincenttis@gmail.com"), true);
      expect(EmailValidator.validate("milton.vincenttisgmailcom"), false);

    });
  });

  group('TESTA ESTADO DO APP', () {
    final AppModel estado = AppModel();

    test('Testa estado inicial == false', () {
      //--- testa estado inicial == false
      expect(estado.isLogado, false);
    });

    test('Testa alteracao de estado para Logado', () {
      estado.isLogado = true;
      expect(estado.isLogado, true);
    });

    test('Testa estado conexao ativa de internet', () async {
      await isConectado().then((value) => estado.hasConexao = value);
      expect(estado.hasConexao, true);
    });
  });
}
