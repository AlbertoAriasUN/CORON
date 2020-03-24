
a = "[";
for i=1:size(DatosNInfectados,2)
    a = a +"{ x: " + i + ", y: " + DatosNInfectados(i) + "},";
    
end
a = a + "}]"
disp(a)