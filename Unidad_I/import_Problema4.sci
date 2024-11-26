clear import_Problema4;

function [data] = import_Problema4(filename)
    opts = detectImportOptions(filename, "Delimiter", ",", "Decimal", ".");
    data = readtable(filename, opts, "VariableNames", ["tiempo","salida","entrada"]);
endfunction

datos = import_Problema4("C:\Users\pacoc\OneDrive\Documentos\Programacion Avanzada\Unidad I\Actividades_nuevas\Problema4.csv");

entrada = datos.vars(3).data;
salida = datos.vars(2).data;
tiempo = datos.vars(1).data;
K = 1.18;
zeta = 0.30;
wn = 0.0099;
s=%s
G = (K*(wn^2))/(s^2+(2*wn*zeta*s)+(wn^2));
G = syslin('c',G);
y = csim(entrada',tiempo',G);
plot(tiempo,salida,tiempo,entrada,tiempo,y);
