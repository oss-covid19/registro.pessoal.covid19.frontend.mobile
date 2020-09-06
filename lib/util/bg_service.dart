import 'dart:async';
import 'package:covid19_pesquisa/model/app_model.dart';

///
/// Responsavel por executar o serviço de verificação de conexao em bg
///

void servicoBackground() {
   const oneSec = const Duration(seconds:3);
   new Timer.periodic(oneSec, (Timer t) => verificador(t));
}


///
/// Cancela o serviço que está executando em background a partir de uma condição
/// obtida em AppModel
///
void verificador(Timer t) {

   if (!AppModel.instance().hasConexao){
      // verificar conexao e setar estado
   }

}