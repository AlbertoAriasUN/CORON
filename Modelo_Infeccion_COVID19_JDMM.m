clc;close all;clear all

diasFuturos = 8; %Cuantos días en el futuro tomará la simulación
diaInicial = 6; %Este valor solo tiene efecto en el label de la gráfica y no en el modelo. El modelo comienza en día 0. Toma 6 para que sea 6 de marzo.

DatosNInfectados = [1 1 1 3 3 9 13 16 24 45 57 75 93 108 158 210 235 306 378 470]; %Vector de datos con el número de infectados diarios desde el 6 de marzo hasta el 23 de marzo

vectorDias =  0:size(DatosNInfectados,2)-1; %Vector que va desde el día 0 de la infección hasta el día actual
modeloObjeto = fit(vectorDias',DatosNInfectados','exp1') %Retorna objeto con las constantes del modelo (a y b) 

%El modelo es de la forma a*exp(b*x)

a = modeloObjeto.a
b = modeloObjeto.b

vectorDiasSimulacion = 0:size(DatosNInfectados,2)+diasFuturos; %Vector que va desde el día 0 de la infección hasta el día de la simulación
modelo = a*exp(b*vectorDiasSimulacion);

scatter(vectorDias+diaInicial,DatosNInfectados,'filled'); %Grafica de los puntos dispersos de los datos reales
hold on
plot(vectorDiasSimulacion+diaInicial,modelo); %Gráfica del modelo ajustado a los datos

%Vista de la gráfica
grid on;
legend('Datos reales', 'Modelo ajustado')
title("Infectados COVID-19 Colombia")
ylabel('Infectados')
xlabel('Dias [Marzo]')

%Predicción dia de mañana:
n = size(DatosNInfectados,2);
nManana = a*exp(b*n);
tolerancia = 0.05;
nMananaMin = nManana*(1-tolerancia);
nMananaMax = nManana*(1+tolerancia);

disp("Mañana "+ (n+6) +" habrán entre " + round(nMananaMin) + " y " + round(nMananaMax) + " casos")

labels = ["06/03","07/03","08/03","09/03","10/03","11/03","12/03","13/03","14/03","15/03","16/03","17/03","18/03","19/03","20/03","21/03","22/03","23/03","24/03","25/03","26/03","27/03","28/03","29/03","30/03","31/03", "01/04", "02/04"];
generarJSON(DatosNInfectados,round(modelo),labels);