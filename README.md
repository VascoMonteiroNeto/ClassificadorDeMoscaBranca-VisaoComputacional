# Trabalho Final de Graduação do curso de Computação(Licenciatura) da Universidade de Brasília do aluno Vasco Monteiro Neto.

## Título: Identificação e contagem de insetos da espécie _Bemisia tabaci_ em amarmadilhas adesivas amarelas. 

## Resumo/Abstract:
### A _Bemisia tabaci_, popularmente conhecida como mosca branca, é considerada hoje a maior praga agrícola do mundo, tanto pelo seu potencial em servir como vetor de diversas fitopatologias quanto por sua distribuição cosmopolita. O objetivo do presente trabalho é usar a visão computacional para propor e comparar o desempenho de classificadores, utilizando aprendizado de máquina, no processo de identificação e contagem da mosca branca em imagens de armadilhas adesivas amarelas tradicionais. O objetivo é otimizar o tempo levado em tal processo, que quando feito de forma manual ainda que por um especialista, pode vir a demandar muito tempo. Um modelo de baixo custo computacional como o K-Nearest Neighbors, apresentou uma acurácia superior a 94% na classificação dos insetos, enquanto no melhor resultado, utilizando um modelo de Rede Neural Convolucional, mais complexo, a acurácia foi de aproximadamente 95,55%. Dessa forma, alguns dos modelos aqui propostos se mostraram eficientes para solucionar o problema da contagem de moscas brancas em armadilhas adesivas, podendo ser incrementado futuramente usando classificadores mais complexos.

### _Bemisia tabaci_, popularly known as the whitefly, is today considered the biggest agricultural pest in the world, both for its potential to serve as a vector for various phytopathologies and also for its cosmopolitan distribution. The objective of the present work is to use computer vision techniques to propose and compare the performance of classifying models, using machine learning and neural networks, in the process of counting and recognize whiteflies in images of traditional yellow sticky traps, in order to optimize the time taken in such a process, that when done manually even by a specialist, it can be very time consuming. A low cost computational model such as KNN showed an accuracy greater than 94% in the classification of these insects, while in the best result, using a more complex CNN model, the accuracy was approximately 95.55%. Some of our proposed models have shown to be efficient in solving the problem of counting whiteflies in sticky traps, however can be increased in the future using more complex classifier models.

## Scripts 
### 'processaImg.m': faz o processamento das imagens e gera o vetor de características usado como entrada de alguns modelos classificadores.
### 'meuKnn.m': modelo classificador KNN, recebe como entrada o vetor  de características.
### 'minhaRedeMLP-VC.m': modelo classificador Multilayer Peceptron, recebe como entrada o vetor  de características.
### 'minhaRedeMLP-Recorte.m': modelo classificador Multilayer Peceptron, recebe como entrada o vetor  de recortes.
### 'minhaRedeCNN.m': modelo classificador Rede Neural Convolucional, recebe como entrada o vetor  de recortes.

### O arquivo "Monografia_VascoMonteiroNeto.pdf" é a parte escrita do trabalho, contendo as motivações, fundamentação teórica, metodologias, resultados obtidos e todo o processo de raciocínio por trás deste trabalho.

### Banco de dados usado: https://data.4tu.nl/articles/dataset/Raw_data_from_Yellow_Sticky_Traps_with_insects_for_training_of_deep_learning_Convolutional_Neural_Network_for_object_detection/12707066
