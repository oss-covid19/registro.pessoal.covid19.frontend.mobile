import 'dart:io';

main() {
  isConectado().then((value) => print(value));
}

Future<bool> isConectado() async {
  bool isConectado = false;
  try {
    var result = await InternetAddress.lookup('example.com');
    isConectado = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    if (!isConectado) {
      result = await InternetAddress.lookup('google.com');
      isConectado = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    }
  } on SocketException catch (e) {
    print(e.toString());
  }
  return Future<bool>.value(isConectado);
}
