###### Copyright (c) 2020 Registro Pessoal - covid-19

#### Projeto open source.

Seu objetivo é permitir uma pessoa registrar o seu estado de saúde com relação ao vírus covid-19 (coronavirus).

A informação de seu estado de saúde será somado a de 
outras pessoas, e assim você pode ter certeza que não está sozinho nessa pandemia.

As únicas informações gravadas no servidor de forma anônima são:
- A sua saúde ao longo tempo, como uma sequencia numerica por exemplo:

0: ==> Não peguei covid-19
1: ==> Não sei se peguei covid-19
2: ==> Peguei covid-19 faz < 14 dias
3: ==> Peguei covid-19 faz <> 14 dias
4: ==> Estou curado de covid-19

usr: <seuEmail>
pwd: <*hashDaSuaSenha>

Mantemos gravado tambem o email e senha (hash), pra manter o vínculo do App com você. Caso você desinstale e reinstale o App, ou mesmo instale o App em outro dispositivo você pode acessar seus dados utilizando seu email e senha (senha do App, não senha do seu email).

O App soma a quantidade de pessoas que estão junto com você controlando seu estado de saúde em tempo real.

* hashDaSuaSenha: é uma impressão digital da sua senha. Não gravamos sua senha e sim a impressão digital dela, portanto não ficará gravado sequer sua senha.


