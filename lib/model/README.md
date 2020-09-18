###### Copyright (c) 2020 Registro Pessoal - covid-19

#### Projeto open source.

##### Modelo de dados client

Aqui fica o Modelo de Dados utilizado do lado cliente.

-app_model.dart => 
    AppModel
        Mantem o estado do App
        Valida entrada de usuário nas telas:
            Entrar
            EsqueceuASenha
            Inscricao
         
/validacao
    entrar_validacao.dart           => validação da tela entrar
    esqueceu_senha_validacao.dart   => validacao da tela esqueceu a senha
    item_validacao.dart             => estrutura de dados para validação de entrada (field)
    

-