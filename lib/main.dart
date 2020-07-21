import 'package:flutter/material.dart';

const String TELA_TITULO = "Registro Pessoal - covid-19";

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TELA_TITULO,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tela1(),
    );
  }
}


class Tela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TELA_TITULO),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Saber mais...'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tela2()),
            );
          },
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }
}
