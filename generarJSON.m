function generarJSON(datosReales,datosModelo,labels)

S = "{";

S = S + '"RealData": [';
for i = 1:size(datosReales,2)
   S = S +  datosReales(i);
   if(i ~= size(datosReales,2))
       S = S + ", ";
   end
end
S = S + "],";

S = S + '"ModelData": [';
for i = 1:size(datosModelo,2)
   S = S +  datosModelo(i);
   if(i ~= size(datosModelo,2))
       S = S + ", ";
   end
end
S = S + "],";

S = S + '"Labels": [';
for i = 1:size(labels,2)
   S = S +'"' +  labels(i) + '"';
   if(i ~= size(labels,2))
       S = S + ", ";
   end
end
S = S + "]";

S = S + "}";

fid = fopen('data.json','wt');
fprintf(fid, S);
fclose(fid);

end