###################################################################
#                                                                 #
#                 Curso de Ver�o - IME USP 2020                   #
#                                                                 #
#             Gr�ficos base do R: Um pequeno tutorial             #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Sum�rio
#   
# 1 Conjunto de dados de exemplo
#   - Descri��o dos dados PlantGrowth
# 2 Gr�ficos
#   2.1 Gr�ficos para vari�veis quantitativas
#       - Histograma
#       - Boxplot
#       - An�lise bivariada entre uma vari�vel quantitativa
#         e uma qualitativa com o boxplot
#   2.2 Gr�ficos para vari�veis qualitativas
#       - Gr�fico de setores (pizza)
#       - Gr�fico de barras
#       - An�lise bivariada entre duas vari�veis qualitativas
#         com o gr�fico de barras

###################################################################
# 1 Conjunto de dados de exemplo                                  #
##################################################################

#   O R possui v�rios conjuntos de dados dispon�veis. Para acess�-los
# � necess�rio utilizar a fun��o 'data'. Para visualizar os dados
# dispon�veis no R, basta rodar o seguinte comando (no RStudio):
data()

# Por exemplo, vamos utilizar o conjunto de dados 'PlantGrowth'.
data("PlantGrowth")

# Descri��o (help)
?PlantGrowth

#   De acordo com o 'help' do conjunto de dados, temos as seguintes 
# informa��es sobre as vari�veis dispon�veis:

# weight: Peso da planta (Unidade n�o informada)
# group:  Tratamentos ao qual a planta foi submetida. Esta vari�vel
#        � um fator com n�veis 'ctrl', 'trt1' e 'trt2' reprensentando,
#        respectivamente, os grupos de controle, tratamento 1 e o
#        tratamento 2.

# Visualiza��o inicial (6 primeiras linhas)
head(PlantGrowth)

# Disponibiliza��o
attach(PlantGrowth)

###################################################################
# 2 Gr�ficos                                                      #
##################################################################

#### 2.1 Gr�ficos para vari�veis quantitativas ####

##############
# Histograma #
##############

# Fun��o: hist
?hist 

# Uso b�sico (N�o rodar o comando abaixo)
hist('variavel', xlab = "Legenda do eixo X",
     ylab = "Legenda do eixo Y",
     main = "T�tulo",
     col = "Cor")

# Por exemplo
hist(weight, xlab = "Peso da planta", ylab = "Frequ�ncia",
     main = " ", col = "lightseagreen")

# OBS: Utilizei o argumento: main = " " para deixar o histograma
# sem um t�tulo central. 

# OBS: As cores podem ser identificadas por n�meros (1 a 8) ou por
# nome. Rode o comando abaixo para visualizar as cores e os seus 
# respectivos n�meros
barplot(1:8, col = 1:8, names.arg = 1:8)
#   Para visualizar uma lista com o nome das cores que podem ser
# utilizadas no R, rode o seguinte comando
colors()

##############
# Boxplot    #
##############

# Fun��o: boxplot
?boxplot

# Uso b�sico (N�o rodar o comando abaixo)
boxplot('variavel', xlab = "Legenda do eixo X",
        ylab = "Legenda do eixo Y",
        col = "Cor")

# Por exemplo
boxplot(weight, ylab = "Peso da planta", col = "lightblue")


# An�lise bivariada entre uma vari�vel quantitativa
#         e uma qualitativa com o boxplot

#   O boxplot permite que seja realizada uma an�lise bivariada
# entre uma vari�vel QUANTITATIVA e uma QUALITATIVA. Geralmente, a
# vari�vel quantitativa � a vari�vel resposta observada, enquanto que
# a qualitativa � um fator com alguns n�veis, e existe o interesse
# em analisar a distribui��o da resposta em cada n�vel deste fator.

# Uso b�sico (N�o rodar o comando abaixo)
boxplot('resposta' ~ 'fator', xlab = "Legenda do eixo X",
        ylab = "Legenda do eixo Y",
        names = c('Um vetor com a identifica��o de cada n�vel do
        fator'),
        col = "Cor")

# OBS: Antes de colocar a identifica��o de cada n�vel do fator no 
# boxplot, veja qual a ordem de entrada deles no gr�fico.

#   Neste conjunto de dados temos a vari�vel 'weight' (quantitativa)
# e 'group' (qualitativa). Aqui, podemos estar interessados em
# analisar a distribui��o do peso das plantas de acordo com cada
# tratamento aplicado.

# Por exemplo
boxplot(weight ~ group)

#   Aqui a ordem de entrada dos n�veis do fator 'group' � 'ctrl',
# 'trt1' e 'trt2'.
boxplot(weight ~ group, xlab = "Grupo", ylab = "Peso da planta",
        names = c("Controle", "Trat 1", "Trat 2"), col = "lightblue")

# ou
boxplot(weight ~ group, xlab = "Grupo", ylab = "Peso da planta",
        names = c("Controle", "Trat 1", "Trat 2"),
        col = c("white", "lightblue", "seagreen"))

# OBS: No histograma, as observa��es da resposta s�o identificadas no
# eixo X, enquanto que no boxplot s�o identificadas no eixo Y.

#### 2.2 Gr�ficos para vari�veis qualitativas ####

######################
# Gr�fico de setores #
######################

# Fun��o: pie
?pie

# Uso b�sico (N�o rodar o comando abaixo)
pie(table('fator'),
    labels = c("Um vetor com a legenda dos n�veis do fator"),
    radius = "Tamanho do raio (por padr�o � 0.8)",
    col = c("Um vetor de cores para os n�veis do fator"))

# Por exemplo
pie(table(group),
    labels = c("Controle", "Trat 1", "Trat 2"),
    radius = 1,
    col = c("white", "lightblue", "seagreen"))

#####################
# Gr�fico de barras #
#####################

# Fun��o: barplot
?barplot

# Uso b�sico (N�o rodar o comando abaixo)
barplot(table('fator'), xlab = "Legenda do eixo X",
        ylab = "Legenda do eixo Y",
        names.arg = c('Um vetor com a identifica��o de cada n�vel do
        fator'),
        col = "Cor")

# Por exemplo
barplot(table(group), xlab = "Grupo",
        ylab = "Frequ�ncia",
        names.arg = c("Controle", "Trat 1", "Trat 2"),
        col = "lightblue")

# OBS: O gr�fico de barras tamb�m pode ser utilizado em vari�veis
# quantitativas DISCRETAS com uma amplitude baixa de valores. 

#######################################################
# An�lise bivariada entre duas vari�veis qualitativas #
#         com o gr�fico de barras                     #
#######################################################

#   A fim de exemplificar uma an�lise bivariada entre duas vari�-
# veis QUALITATIVAS com a fun��o 'barplot', considere o acr�scimo
# (artificial !!!) da vari�vel 'species' ao conjunto de dados.
set.seed(1234)
species <- as.factor(sample(c("type 1","type 2","type 3","type 4"),
                         30, replace = TRUE))
species

# Uso b�sico (N�o rodar o comando abaixo)
barplot(table('fator1', 'fator2'),
        xlab = "Legenda do eixo X (fator2)",
        ylab = "Legenda do eixo Y",
        legend.text = TRUE,
        args.legend = list(legend = c('Um vetor com a identifica��o de cada n�vel do fator 1')),
        names.arg = c('Um vetor com a identifica��o de cada n�vel do fator 2'),
        col = c("Um vetor de cores para os n�veis do fator 1"))

# Por exemplo
barplot(table(group, species), xlab = "Esp�cie",
        ylab = "Frequ�ncia", 
        legend.text = TRUE, 
        args.legend = list(legend = c("Controle", "Trat 1", "Trat 2")),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"))

#   Para melhorar a visualiza��o da legenda, podemos colocar as barras
# ao lado, ao inv�s de empilh�-las com o comando beside = TRUE
barplot(table(group, species), xlab = "Esp�cie",
        ylab = "Frequ�ncia", 
        legend.text = TRUE,
        args.legend = list(legend = c("Controle", "Trat 1", "Trat 2")),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"),
        beside = TRUE)

#   Para trocar a legenda da direita para a esquerda utilize o comando
# x = "topleft" antes da legenda dos n�veis do fator 1 da seguinte
# forma:
barplot(table(group, species), xlab = "Esp�cie",
        ylab = "Frequ�ncia", 
        legend.text = TRUE,
        args.legend = list(x = "topleft", legend = c("Controle", "Trat 1", "Trat 2")),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"),
        beside = TRUE)

#   Por fim, para retirar a caixa de contorno deta legenda, ainda po-
# demos utilizar o comando bty = "n" ap�s a legenda dos n�veis do 
# fator 1 da forma
barplot(table(group, species), xlab = "Esp�cie",
        ylab = "Frequ�ncia", 
        legend.text = TRUE,
        args.legend = list(x = "topleft",
                           legend = c("Controle", "Trat 1", "Trat 2"),
                              bty = "n"),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"), beside = TRUE)
