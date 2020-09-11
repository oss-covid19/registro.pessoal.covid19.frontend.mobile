import 'dart:async';

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

   if (true){
      // verificar conexao e setar estado
   }

}