# calculo-numerico-2024
Repositório da disciplina de Cálculo Numérico da Turma 1 de Engenharia Biomédica, 2024.

### Enviando ```func``` como argumento de funções

Caso você deseje criar uma função em uma linha no Octave, é possível utilizar o operador handle ```@```.

Por exemplo, caso você queira criar a função ```f(x)=cos(10x)+sin(3x)``` com o nome de ```f```:

```
f = @(x)cos(10x)+sin(3x)
```
Isso significa que a função de nome ```f``` possui ```x``` como variável (```@(x)```) e é avaliada como ```cos(10x)+sin(3x)```.

Assim é possível agora chamar a função com nome ```f``` com o valor que queremos de x:

```
f(3)
ans = -1.8992
```

Dizemos que ```f``` é um *handle* da função construída.

Esse tipo de aplicação pode ser utilizada como argumentos de funções. Por exemplo, dada uma função ```myfunc()```, podemos agora passar ```f``` como argumento: ```myfunc(f,...)```, onde ```...``` apenas significa os outros argumentos da função. Outro modo, é enviar direto à função: ```myfunc(@(x)cos(10x)+sin(3x),...)```.