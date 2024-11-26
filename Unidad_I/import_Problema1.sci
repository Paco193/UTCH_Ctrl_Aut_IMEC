clear import_Problema1;

function [data] = import_Problema1(filename)
    opts = detectImportOptions(filename, "Delimiter", ",", "Decimal", ".");
    data = readtable(filename, opts, "VariableNames", ["tiempo","salida","entrada"]);
endfunction

datos = import_Problema1("C:\Users\pacoc\OneDrive\Documentos\Programacion Avanzada\Unidad I\Actividades_nuevas\Problema1.csv");

entrada = datos.vars(3).data;
salida = datos.vars(2).data;
tiempo = datos.vars(1).data;
K = 2.04;
tao = 500.6;
s=%s
G = K/(tao*s+1)
G = syslin('c',G);
y = csim(entrada',tiempo',G);
plot(tiempo,salida,tiempo,entrada,tiempo,y);
