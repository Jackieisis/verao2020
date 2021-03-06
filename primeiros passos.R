###################################################################
#                                                                 #
#                 Curso de Ver�o - IME USP 2020                   #
#                                                                 #
#                      Primeiros passos no R                      #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Principal refer�ncia
# http://material.curso-r.com/rbase/

# Sum�rio
# - R como calculadora
# - Objetos
#     - Atribui��o
#     - Vizualiza��o dos objetos
#     - Tipos b�sicos de objetos no R 
#     - Vetores 
#     - Matrizes
#     - Fatores 
#     - Valores especiais 
#     - Data frames

###########################
# R como calculadora      #
##########################
2 + 3   # adi��o
14 - 23 # subtra��o
7 * 8   # multiplica��o
5 / 3   # divis�o
2 ^ 5   # pot�ncia
3 %% 2  # resto da divis�o de 3 por 2
3i * 2i # opera��o com n�meros complexos

#   As opera��es e suas preced�ncias s�o mantidas como na matem�tica,
# ou seja, divis�o e multiplica��o s�o calculadas antes da adi��o e
# subtra��o. 
3 + 4 * 2 
5 * 2 - 1,5 / 3 # Erro na sintaxe do '1,5', o correto � '1.5'
5 * 2 - 1.5 / 3
5 + (- 1)
(2 + 6) * (5 + 4)

#   Comandos incompletos ser�o destacados com o s�mbolo '+'. N�o 
# confundir com o operador de adi��o.
5 -
  
###########################
# Objetos                 #
##########################

### Atribui��o ###
x <- 2  
y <- 3
7 -> z

# OBS: Tamb�m podemos utilizar o sinal '=', ao inv�s de '<-' para
# atribui��es.

# OBS: O R diferencia letras mai�sculas e min�sculas. 

### Visualiza��o dos objetos ###
x
print(x)
print(paste(x, y, z))

### Tipos b�sicos de objetos no R ###

# - character
"jo�o"
"maria"
"234"

# - numeric
1
0.10
pi

# - integer
1L
5L
10L

# - complex
2 + 5i

# - logical
TRUE
FALSE

# Para saber a classe de um objeto, utiliza-se a fun��o 'class'
x <- "maria"
class(x)

### Vetores ###
vetor1 <- c(1, 2, 3, 4)
vetor2 <- c("a", "b", "c", "d")

vetor1
vetor2

# O vetor sempre possui a classe dos elementos que carrega
class(vetor1)
class(vetor2)

#    Se adicionarmos a um vetor elementos com diferentes classes, este
# s� poder� ter uma classe. A ordem de preced�ncia das classes s�o
# character > complex > numeric > integer > logical
vetor3 <- c("a", 1, 2.3, 2L, TRUE)
class(vetor3)
vetor4 <- c(1, 2.3, 2L, TRUE)
class(vetor4)

### Opera��es com vetores ###
vetor1 - 1
vetor1 / 2
vetor1 * 10
vetor1 * vetor1

# OBS: Tome cuidado com express�es com vetores de tamanhos diferentes.
vetor5 <- 1:3
vetor1 * vetor5

### Matrizes ###
m1 <- matrix(1:6, nrow = 2)
m1

#    Os n�meros de 1 a 6 foram dispostos por coluna da esquerda para a 
# direita. Para adicionar os n�meros por coluna, basta escrever a op��o
# 'byrow = TRUE' nos argumentos da fun��o 'matrix'.
m2 <- matrix(1:6, nrow = 2, byrow = TRUE)
m2

#   Algumas opera��es �teis com matizes s�o dadas a seguir.
m3 <- matrix(1:6, ncol = 2)

m1[2,  ]   # seleciona a segunda linha
m1[ , 1]   # seleciona a primeira coluna
m1[1, 2]   # seleciona o primeiro elemento da segunda coluna
t(m1)      # matriz transposta
m1 %*% m3  # multiplica��o matricial

m4 <- matrix(1:4, nrow = 2)
solve(m4)  # matriz inversa de m4

### Fatores ###

# Os fatores podem ser vistos como um vetor de inteiros com r�tulos
sexo <- c("M", "H", "H", "H", "M", "M", "H")
fator <- as.factor(sexo)
fator

# A fun��o 'levels()' retorna os r�tulos do fator
levels(fator)

#    A ordem dos n�veis dos fatores pode importar, por exemplo na ordem
# de apresenta��o em gr�ficos de barras. Por padr�o, o R coloca os 
# n�veis em ordem alfab�tica.

### Valores especiais ###

# NA (Not Available)

#    Significa dado faltante/indispon�vel. O NA tem uma classe, ou
# seja, podemos ter NA numeric, NA character etc.

# NaN (Not a Number)

#   Representa indefini��es matem�ticas, como 0/0 e log(-1). Um NaN �
# um NA, mas a rec�proca n�o � verdadeira.

# Inf (Infinito)

#    � um n�mero muito grande ou o limite matem�tico, por exemplo, 1/0
# e 10^310. Aceita sinal negativo -Inf.

# NULL

#   Representa a aus�ncia de informa��o. Conceitualmente, a diferen�a
# entre NA e NULL � sutil, mas, no R, o NA est� mais alinhado com os
# conceitos de estat�stica (ou como gostar�amos que os dados faltantes
# se comportassem em an�lise de dados) e o NULL est� em sintonia com
# comportamentos de l�gica de programa��o.

### Data frames ###

#   Os data.frame's s�o listas especiais em que todos os elementos
# possuem o mesmo comprimento. Cada elemento dessa lista pode ser
# pensado como uma coluna da tabela. Seu comprimento representa o
# n�mero de linhas.

dados <- data.frame(individuo = c("a", "b", "c"),
                    idade = c(23, 34, 47),
                    sexo = as.factor(c("H", "F", "F")),
                    renda = c(2300, 1250, 10246))

dados
