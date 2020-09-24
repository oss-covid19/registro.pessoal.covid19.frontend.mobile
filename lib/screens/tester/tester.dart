import 'package:covid19_pesquisa/screens/tester/tester_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TesterModel(),
        child: MaterialApp(
          title: 'Entrar',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: EntrarScreen(),
        ));
  }
}

class EntrarScreen extends StatelessWidget {
  const EntrarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TesterModel model = Provider.of<TesterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tester InputText'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'email',
                errorText: model.tester,
              ),
              onChanged: (value) {
                print('value:  $value');
                model.tester = value;
                print('model.tester:  ${model.tester}');
              },
              onEditingComplete: () {
                print('finalizou');
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'nome',
                errorText: model.tester,
              ),
              onChanged: (value) {
                print('value:  $value');
                model.tester = value;
                print('model.tester:  ${model.tester}');
              },
              onEditingComplete: () {
                print('finalizou');
              },
            ),
          ],
        ),
      ),
    );
  }
}
