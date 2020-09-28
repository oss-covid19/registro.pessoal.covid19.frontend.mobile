import 'package:flutter/material.dart';

/// constantes titulo de paginas
const String APP_TITLE = "Registro Pessoal: Covid-19";
const String TELA_TITULO = APP_TITLE;


/// constantes layout
const int BUTTON_COLOR = 0xffc4dff6;

/// botões pagina home_screen
const String PERGUNTA = 'Como está minha saúde?';
const String BUTTON0_TEXT = 'Não peguei covid-19';
const String BUTTON1_TEXT = 'Não sei se peguei covid-19';
const String BUTTON2_TEXT = 'Peguei covid-19 faz < 14 dias';
const String BUTTON3_TEXT = 'Peguei covid-19 faz > 14 dias';
const String BUTTON4_TEXT = 'Estou curado de covid-19';
const String TEXT_BOTTOM = 'A informação é anônima nenhum dado a mais é obtido ou armazenado. Esse App não tem vínculo com o Ministério da Saúde.';


///
/// Utilizado em :
/// => entrar_validacao.dar
/// => esqueceu_senha_model.dart
/// =>
const String EMAIL_ERRO = "Email deve ser um email valido";
const String EMAIL_VAZIO = "Você deve informar um email valido";
const String SENHA_ERRO = "A senha deve ter min 4 digitos/alfanumericos";
const String SENHA_VAZIO = "Você deve informar sua senha";
const String SENHA_NAO_IGUAIS = "As senhas são diferentes";

///
/// utilizado em:
/// => inscricao_xxx
///
const String SENHA_DEVE_CRIAR = "Você tem que criar uma senha de 4-6 digitos alfanuméricos";


ShapeBorder globalDefineButtonShape() {
   return defineButtonShape();
}

///--- define aspectos dos botões: cor da borda,
 ShapeBorder defineButtonShape() {
   return RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), );
}