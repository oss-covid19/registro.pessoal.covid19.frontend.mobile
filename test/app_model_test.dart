import 'package:covid19_pesquisa/model/app_model.dart';
import 'package:covid19_pesquisa/util/conexao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

    test('Testa conexao ativa de internet', () async {
      await isConectado().then((value) => estado.hasConexao = value);
      expect(estado.hasConexao, true);
    });
  });
}
