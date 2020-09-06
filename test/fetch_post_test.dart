import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

main() {
  test('Retorna "pong" e 200 se o Request GET foi sucesso', () {
    final client = http.Client();

    when(client
        .get('http://localhost:8080/registro-pessoal-covid19/ping')
        .then((_) async => http.Response('pong', 200)));
  });
}
