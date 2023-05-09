-- EJERCICIOS
/*

1 - Escriba un bloque de codigo PL/pgSQL que reciba una nota como parametro
    y notifique en la consola de mensaje las letras A,B,C,D,E o F segun el valor de la nota

*/
DO $$
DECLARE nota int =10;
BEGIN
if nota<5 THEN
	RAISE NOTICE 'lA NOTA ES: F';
elsif nota<7 THEN
	RAISE NOTICE 'lA NOTA ES: E';
elsif nota<8 THEN
	RAISE NOTICE 'lA NOTA ES: D';
elsif nota<9 THEN
	RAISE NOTICE 'lA NOTA ES: C';
elsif nota<10 THEN
	RAISE NOTICE 'lA NOTA ES: B';
else 
	RAISE NOTICE 'lA NOTA ES: A';
END IF;
END $$ language 'plpgsql';

/*
2 - Escriba un bloque de codigo PL/pgSQL que reciba un numero como parametro
    y muestre la tabla de multiplicar de ese numero.
*/

DO $$
DECLARE 
    num int := 6;
    i integer;
    resultado integer;
BEGIN
    FOR i IN 1..10 LOOP
        resultado := num * i;
        RAISE NOTICE '% x % = %', num, i, resultado;
    END LOOP;
END$$ LANGUAGE plpgsql;
/*
3 - Escriba una funcion PL/pgSQL que convierta de dolares a moneda nacional.
    La funcion debe recibir dos parametros, cantidad de dolares y tasa de cambio.
    Al final debe retornar el monto convertido a moneda nacional.
*/
DO $$
DECLARE
	dolares numeric :=2;
	tasa numeric :=0.91;
	resultado numeric;
BEGIN
	resultado := dolares*tasa;
	RAISE NOTICE '% x % = %', dolares, tasa, resultado;
END $$ LANGUAGE plpgsql;
/*

4 - Escriba una funcion PL/pgSQL que reciba como parametro el monto de un prestamo,
    su duracion en meses y la tasa de interes, retornando el monto de la cuota a pagar.
    Aplicar el metodo de amortizacion frances.

*/
DO $$
DECLARE inicial numeric:=1000;
duracion numeric:=5;
tasa_interes numeric:=0.10;
cuota numeric;
interes_mensual numeric:= tasa_interes/12;
factor numeric:= (1+ interes_mensual)^duracion;
 
BEGIN
cuota:= (inicial * interes_mensual * factor) / (factor -1);
RAISE NOTICE 'cantidad mensual: %', cuota;
END $$ LANGUAGE plpgsql;