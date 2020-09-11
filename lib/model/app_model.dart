import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

///
/// hasConexao:      Se há conexão: wifi ou dados
/// isLogado:        Se Usuário fez Login ou não
/// isEntrar:        Ação escolhida pelo Usuário
/// isEsqueciASenha: Ação escolhida pelo Usuário
/// isInscrever:     Ação escolhida pelo Usuário
///

class AppModel extends ChangeNotifier with DiagnosticableTreeMixin {
  bool _hasConexao = false;

  bool get hasConexao => _hasConexao;
  set hasConexao(bool hasConexao) =>
      {_hasConexao = isLogado, notifyListeners()};

  ///-------------------------------------------------------------------------

  bool _isLogado = false;

  bool get isLogado => _isLogado;
  set isLogado(bool isLogado) => {_isLogado = isLogado, notifyListeners()};

  ///-------------------------------------------------------------------------

  bool _isEntrar = false;

  bool get isEntrar => _isEntrar;
  set isEntrar(bool isEntrar) => {_isEntrar = isEntrar, notifyListeners()};

  ///-------------------------------------------------------------------------

  bool _isEsqueciASenha = false;

  bool get isEsqueciASenha => _isEsqueciASenha;
  set isEsqueciASenha(bool isEsqueciASenha) =>
      {_isEsqueciASenha = isEsqueciASenha, notifyListeners()};

  ///-------------------------------------------------------------------------

  bool _isInscrever = false;

  bool get isInscrever => _isInscrever;
  set isInscrever(bool isInscrever) =>
      {_isInscrever = isInscrever, notifyListeners()};

  ///
  /// Debugging
  ///
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isLogado', _isLogado));
    properties.add(DiagnosticsProperty<bool>('isEntrar', _isEntrar));
    properties
        .add(DiagnosticsProperty<bool>('isEsqueciASenha', _isEsqueciASenha));
    properties.add(DiagnosticsProperty<bool>('isInscrever', _isInscrever));
  }



  ///--------------------------------------------------------------------------

  static AppModel instanceOf(BuildContext context) {
    return Provider.of<AppModel>(context, listen: false);
  }


}
