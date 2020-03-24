clc;close all;clear all

diasFuturos = 9; %Cuantos d�as en el futuro tomar� la simulaci�n
diaInicial = 6; %Este valor solo tiene efecto en el label de la gr�fica y no en el modelo. El modelo comienza en d�a 0. Toma 6 para que sea 6 de marzo.

DatosNInfectados = [1 1 1 3 3 9 13 16 24 45 57 75 93 108 145 210 235]; %Vector de datos con el n�mero de infectados diarios desde el 6 de marzo hasta el 22 de marzo

vectorDias =  0:size(DatosNInfectados,2)-1; %Vector que va desde el d�a 0 de la infecci�n hasta el d�a actual
modeloObjeto = fit(vectorDias',DatosNInfectados','exp1') %Retorna objeto con las constantes del modelo (a y b) 

%El modelo es de la forma a*exp(b*x)

a = modeloObjeto.a
b = modeloObjeto.b

vectorDiasSimulacion = 1:size(DatosNInfectados,2)+diasFuturos; %Vector que va desde el d�a 0 de la infecci�n hasta el d�a de la simulaci�n
modelo = a*exp(b*vectorDiasSimulacion);

scatter(vectorDias+diaInicial,DatosNInfectados,'filled'); %Grafica de los puntos dispersos de los datos reales
hold on
plot(vectorDiasSimulacion+diaInicial,modelo); %Gr�fica del modelo ajustado a los datos

%Vista de la gr�fica
grid on;
legend('Datos reales', 'Modelo ajustado')
title("Infectados COVID-19 Colombia")
ylabel('Infectados')
xlabel('Dias [Marzo]')