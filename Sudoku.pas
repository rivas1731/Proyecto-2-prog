program sudoku;
uses crt;
const
	N = 9;//constante para numero ramdom
	pistas_m = 51;//constante para las pistas a ocultar
type
	matriz= array[1..9,1..9] of integer;
	cuadrante= array [1..3,1..3] of integer;
var 
	opc, i, f, c, val_int, v: integer;
	tablero, tablero_u, pistas_i: matriz;
	val_str, opc_u, opc_salir: string;
	n_val, validar_n, validar_c, fin, usuario_se_rinde: boolean;
	
	procedure tablero_usuario(tablero_u: matriz; tablero: matriz; pistas_i: matriz);
	var
		i, j, k: integer;
		hayError: boolean;

		validar_n: boolean;
	begin
		writeln('Asi va el tablero.');
		writeln();
		textcolor(15);
		writeln('   1 2 3  4 5 6  7 8 9');  // Imprime los números de las columnas
		writeln('  ----------------------');

		for i:= 1 to 9 do//para recorrer y mostrar el tablero
		begin
			textcolor(9);
			write(i, ' ');  // Imprime el número de la fila
			write('|');
			for j:= 1 to 9 do 
			begin
			if tablero_u[i,j] = 0 then//en lugar de 0 escribe un espacio en blanco
			begin
				write('  ');
			end
			else
			begin
				if pistas_i[i,j] <> 0 then
				textcolor(10)  // Cambia el color a verde si la celda contiene una pista
			else if tablero_u[i,j] <> tablero[i,j] then
			begin
				textbackground(12);  // Cambia el color a rojo si el valor es incorrecto
				textcolor(15);  // Cambia el color a blanco
			end
			else
				textcolor(15);  // Cambia el color a blanco para los otros números

				write(tablero_u[i,j], ' ');
			end;
			if (j mod 3 = 0) then//cada que pasen 3 posiciones imprime una barra para separar cuadrantes
			begin
				textcolor(15);
				write('|');
			end;
			textbackground(black);
		end;
		writeln();
		textcolor(9);
		if (i mod 3 = 0 ) then//igual pero en las filas
			textcolor(15);
			writeln('  ----------------------');
		end;
		hayError := false;
		for i := 1 to 9 do//para mostrar la opcion de rendirse solo cuando haya error en el tablero
		begin
			for j := 1 to 9 do
			begin
				if (tablero_u[i,j] <> 0) and (tablero_u[i,j] <> tablero[i,j]) then
				begin
					hayError := true;
					break;
				end;
			end;
			if hayError then break;
			end;

		// Si hay un error, muestra el mensaje
		if hayError then
		begin
			repeat
			repeat
				writeln('Desea rendirse?');
				writeln('1. Si');
				writeln('2. No');
				readln(opc_salir);
				validar_n := false;
				for k := 1 to Length(opc_salir) do  // For para verificar que el valor ingresado sea un número
				begin
					if not (opc_salir[k] in ['0'..'9']) then
					begin
					validar_n := true;
					break;
					end;
				end;
				if validar_n then
				begin
					writeln('La opcion ingresada no es valida, por favo ingrese una opcion valida.');
					writeln('Presione enter para continuar');
					readln();
				end;
			until not validar_n;
			if (opc_salir < '1') or (opc_salir > '2') then
			begin
				writeln('La opcion seleccionada no es valida. Por favor ingrese una opcion valida');
				writeln('Presione enter para continuar');
				readln();
			end
			else if (opc_salir = '1') then
				usuario_se_rinde := true;
			until (opc_salir = '1') or (opc_salir = '2');
		end;
	end;//del procedimiento

	
	procedure tableros_resueltos;//para rellenar los tableros
	begin//del rpocedimiento
		repeat
			randomize;
			opc:= random(5);//para evitar que el random generado sea 0
		until opc <> 0;
	case opc of//inicio case 
		1:
		begin//rellenando tablero principal
			textcolor(white);
			tablero[1,1]:= 3;
			tablero[1,2]:= 9;
			tablero[1,3]:= 8;
			tablero[1,4]:= 1;
			tablero[1,5]:= 5;
			tablero[1,6]:= 2;
			tablero[1,7]:= 6;
			tablero[1,8]:= 4;
			tablero[1,9]:= 7;
			tablero[2,1]:= 2;
			tablero[2,2]:= 1;
			tablero[2,3]:= 4;
			tablero[2,4]:= 8;
			tablero[2,5]:= 6;
			tablero[2,6]:= 7;
			tablero[2,7]:= 9;
			tablero[2,8]:= 5;
			tablero[2,9]:= 3;
			tablero[3,1]:= 7;
			tablero[3,2]:= 6;
			tablero[3,3]:= 5;
			tablero[3,4]:= 4;
			tablero[3,5]:= 9;
			tablero[3,6]:= 3;
			tablero[3,7]:= 1;
			tablero[3,8]:= 2;
			tablero[3,9]:= 8;
			tablero[4,1]:= 1;
			tablero[4,2]:= 3;
			tablero[4,3]:= 9;
			tablero[4,4]:= 7;
			tablero[4,5]:= 2;
			tablero[4,6]:= 8;
			tablero[4,7]:= 4;
			tablero[4,8]:= 6;
			tablero[4,9]:= 5;
			tablero[5,1]:= 4;
			tablero[5,2]:= 8;
			tablero[5,3]:= 6;
			tablero[5,4]:= 5;
			tablero[5,5]:= 3;
			tablero[5,6]:= 9;
			tablero[5,7]:= 2;
			tablero[5,8]:= 7;
			tablero[5,9]:= 1;
			tablero[6,1]:= 5;
			tablero[6,2]:= 7;
			tablero[6,3]:= 2;
			tablero[6,4]:= 6;
			tablero[6,5]:= 4;
			tablero[6,6]:= 1;
			tablero[6,7]:= 3;
			tablero[6,8]:= 8;
			tablero[6,9]:= 9;
			tablero[7,1]:= 6;
			tablero[7,2]:= 2;
			tablero[7,3]:= 1;
			tablero[7,4]:= 9;
			tablero[7,5]:= 8;
			tablero[7,6]:= 5;
			tablero[7,7]:= 7;
			tablero[7,8]:= 3;
			tablero[7,9]:= 4;
			tablero[8,1]:= 9;
			tablero[8,2]:= 5;
			tablero[8,3]:= 3;
			tablero[8,4]:= 2;
			tablero[8,5]:= 7;
			tablero[8,6]:= 4;
			tablero[8,7]:= 8;
			tablero[8,8]:= 1;
			tablero[8,9]:= 6;
			tablero[9,1]:= 8;
			tablero[9,2]:= 4;
			tablero[9,3]:= 7;
			tablero[9,4]:= 3;
			tablero[9,5]:= 1;
			tablero[9,6]:= 6;
			tablero[9,7]:= 5;
			tablero[9,8]:= 9;
			tablero[9,9]:= 2;


		end;//opc 1 case
		
		2:
		begin
			tablero[1,1]:= 1;
			tablero[1,2]:= 3;
			tablero[1,3]:= 6;
			tablero[1,4]:= 4;
			tablero[1,5]:= 9;
			tablero[1,6]:= 2;
			tablero[1,7]:= 5;
			tablero[1,8]:= 8;
			tablero[1,9]:= 7;
			tablero[2,1]:= 5;
			tablero[2,2]:= 9;
			tablero[2,3]:= 4;
			tablero[2,4]:= 7;
			tablero[2,5]:= 6;
			tablero[2,6]:= 8;
			tablero[2,7]:= 1;
			tablero[2,8]:= 3;
			tablero[2,9]:= 2;
			tablero[3,1]:= 7;
			tablero[3,2]:= 2;
			tablero[3,3]:= 8;
			tablero[3,4]:= 3;
			tablero[3,5]:= 1;
			tablero[3,6]:= 5;
			tablero[3,7]:= 9;
			tablero[3,8]:= 6;
			tablero[3,9]:= 4;
			tablero[4,1]:= 8;
			tablero[4,2]:= 6;
			tablero[4,3]:= 1;
			tablero[4,4]:= 5;
			tablero[4,5]:= 7;
			tablero[4,6]:= 4;
			tablero[4,7]:= 2;
			tablero[4,8]:= 9;
			tablero[4,9]:= 3;
			tablero[5,1]:= 2;
			tablero[5,2]:= 7;
			tablero[5,3]:= 5;
			tablero[5,4]:= 9;
			tablero[5,5]:= 3;
			tablero[5,6]:= 1;
			tablero[5,7]:= 6;
			tablero[5,8]:= 4;
			tablero[5,9]:= 8;
			tablero[6,1]:= 3;
			tablero[6,2]:= 4;
			tablero[6,3]:= 9;
			tablero[6,4]:= 2;
			tablero[6,5]:= 8;
			tablero[6,6]:= 6;
			tablero[6,7]:= 7;
			tablero[6,8]:= 1;
			tablero[6,9]:= 5;
			tablero[7,1]:= 6;
			tablero[7,2]:= 5;
			tablero[7,3]:= 7;
			tablero[7,4]:= 1;
			tablero[7,5]:= 4;
			tablero[7,6]:= 3;
			tablero[7,7]:= 8;
			tablero[7,8]:= 2;
			tablero[7,9]:= 9;
			tablero[8,1]:= 4;
			tablero[8,2]:= 8;
			tablero[8,3]:= 2;
			tablero[8,4]:= 6;
			tablero[8,5]:= 5;
			tablero[8,6]:= 9;
			tablero[8,7]:= 3;
			tablero[8,8]:= 7;
			tablero[8,9]:= 1;
			tablero[9,1]:= 9;
			tablero[9,2]:= 1;
			tablero[9,3]:= 3;
			tablero[9,4]:= 8;
			tablero[9,5]:= 2;
			tablero[9,6]:= 7;
			tablero[9,7]:= 4;
			tablero[9,8]:= 5;
			tablero[9,9]:= 6;
			
		end;//opc 2 case
		
		3:
		begin
			tablero[1,1]:= 2;
			tablero[1,2]:= 1;
			tablero[1,3]:= 9;
			tablero[1,4]:= 5;
			tablero[1,5]:= 4;
			tablero[1,6]:= 3;
			tablero[1,7]:= 6;
			tablero[1,8]:= 7;
			tablero[1,9]:= 8;
			tablero[2,1]:= 5;
			tablero[2,2]:= 4;
			tablero[2,3]:= 3;
			tablero[2,4]:= 8;
			tablero[2,5]:= 7;
			tablero[2,6]:= 6;
			tablero[2,7]:= 9;
			tablero[2,8]:= 1;
			tablero[2,9]:= 2;
			tablero[3,1]:= 8;
			tablero[3,2]:= 7;
			tablero[3,3]:= 6;
			tablero[3,4]:= 2;
			tablero[3,5]:= 1;
			tablero[3,6]:= 9;
			tablero[3,7]:= 3;
			tablero[3,8]:= 4;
			tablero[3,9]:= 5;
			tablero[4,1]:= 4;
			tablero[4,2]:= 3;
			tablero[4,3]:= 2;
			tablero[4,4]:= 7;
			tablero[4,5]:= 6;
			tablero[4,6]:= 5;
			tablero[4,7]:= 8;
			tablero[4,8]:= 9;
			tablero[4,9]:= 1;
			tablero[5,1]:= 7;
			tablero[5,2]:= 6;
			tablero[5,3]:= 5;
			tablero[5,4]:= 1;
			tablero[5,5]:= 9;
			tablero[5,6]:= 8;
			tablero[5,7]:= 2;
			tablero[5,8]:= 3;
			tablero[5,9]:= 4;
			tablero[6,1]:= 1;
			tablero[6,2]:= 9;
			tablero[6,3]:= 8;
			tablero[6,4]:= 4;
			tablero[6,5]:= 3;
			tablero[6,6]:= 2;
			tablero[6,7]:= 5;
			tablero[6,8]:= 6;
			tablero[6,9]:= 7;
			tablero[7,1]:= 3;
			tablero[7,2]:= 2;
			tablero[7,3]:= 1;
			tablero[7,4]:= 6;
			tablero[7,5]:= 5;
			tablero[7,6]:= 4;
			tablero[7,7]:= 7;
			tablero[7,8]:= 8;
			tablero[7,9]:= 9;
			tablero[8,1]:= 6;
			tablero[8,2]:= 5;
			tablero[8,3]:= 4;
			tablero[8,4]:= 9;
			tablero[8,5]:= 8;
			tablero[8,6]:= 7;
			tablero[8,7]:= 1;
			tablero[8,8]:= 2;
			tablero[8,9]:= 3;
			tablero[9,1]:= 9;
			tablero[9,2]:= 8;
			tablero[9,3]:= 7;
			tablero[9,4]:= 3;
			tablero[9,5]:= 2;
			tablero[9,6]:= 1;
			tablero[9,7]:= 4;
			tablero[9,8]:= 5;
			tablero[9,9]:= 6;
			
		end;//opc 3 case
		
		4: 
		begin
			tablero[1,1]:= 7;
			tablero[1,2]:= 6;
			tablero[1,3]:= 1;
			tablero[1,4]:= 3;
			tablero[1,5]:= 4;
			tablero[1,6]:= 9;
			tablero[1,7]:= 8;
			tablero[1,8]:= 2;
			tablero[1,9]:= 5;
			tablero[2,1]:= 3;
			tablero[2,2]:= 8;
			tablero[2,3]:= 2;
			tablero[2,4]:= 7;
			tablero[2,5]:= 5;
			tablero[2,6]:= 1;
			tablero[2,7]:= 6;
			tablero[2,8]:= 9;
			tablero[2,9]:= 4;
			tablero[3,1]:= 5;
			tablero[3,2]:= 9;
			tablero[3,3]:= 4;
			tablero[3,4]:= 2;
			tablero[3,5]:= 8;
			tablero[3,6]:= 6;
			tablero[3,7]:= 7;
			tablero[3,8]:= 3;
			tablero[3,9]:= 1;
			tablero[4,1]:= 6;
			tablero[4,2]:= 2;
			tablero[4,3]:= 5;
			tablero[4,4]:= 9;
			tablero[4,5]:= 7;
			tablero[4,6]:= 3;
			tablero[4,7]:= 4;
			tablero[4,8]:= 1;
			tablero[4,9]:= 8;
			tablero[5,1]:= 8;
			tablero[5,2]:= 3;
			tablero[5,3]:= 7;
			tablero[5,4]:= 6;
			tablero[5,5]:= 1;
			tablero[5,6]:= 4;
			tablero[5,7]:= 9;
			tablero[5,8]:= 5;
			tablero[5,9]:= 2;
			tablero[6,1]:= 4;
			tablero[6,2]:= 1;
			tablero[6,3]:= 9;
			tablero[6,4]:= 5;
			tablero[6,5]:= 2;
			tablero[6,6]:= 8;
			tablero[6,7]:= 3;
			tablero[6,8]:= 7;
			tablero[6,9]:= 6;
			tablero[7,1]:= 9;
			tablero[7,2]:= 4;
			tablero[7,3]:= 3;
			tablero[7,4]:= 1;
			tablero[7,5]:= 6;
			tablero[7,6]:= 5;
			tablero[7,7]:= 2;
			tablero[7,8]:= 8;
			tablero[7,9]:= 7;
			tablero[8,1]:= 2;
			tablero[8,2]:= 5;
			tablero[8,3]:= 8;
			tablero[8,4]:= 4;
			tablero[8,5]:= 9;
			tablero[8,6]:= 7;
			tablero[8,7]:= 1;
			tablero[8,8]:= 6;
			tablero[8,9]:= 3;
			tablero[9,1]:= 1;
			tablero[9,2]:= 7;
			tablero[9,3]:= 6;
			tablero[9,4]:= 8;
			tablero[9,5]:= 3;
			tablero[9,6]:= 2;
			tablero[9,7]:= 5;
			tablero[9,8]:= 4;
			tablero[9,9]:= 9;
			
		end;//opc 4 case
		
		5:
		begin
			tablero[1,1]:= 4;
			tablero[1,2]:= 6;
			tablero[1,3]:= 2;
			tablero[1,4]:= 5;
			tablero[1,5]:= 9;
			tablero[1,6]:= 1;
			tablero[1,7]:= 3;
			tablero[1,8]:= 8;
			tablero[1,9]:= 7;
			tablero[2,1]:= 1;
			tablero[2,2]:= 3;
			tablero[2,3]:= 9;
			tablero[2,4]:= 6;
			tablero[2,5]:= 8;
			tablero[2,6]:= 7;
			tablero[2,7]:= 4;
			tablero[2,8]:= 2;
			tablero[2,9]:= 5;
			tablero[3,1]:= 7;
			tablero[3,2]:= 5;
			tablero[3,3]:= 8;
			tablero[3,4]:= 3;
			tablero[3,5]:= 4;
			tablero[3,6]:= 2;
			tablero[3,7]:= 1;
			tablero[3,8]:= 9;
			tablero[3,9]:= 6;
			tablero[4,1]:= 6;
			tablero[4,2]:= 9;
			tablero[4,3]:= 1;
			tablero[4,4]:= 7;
			tablero[4,5]:= 3;
			tablero[4,6]:= 8;
			tablero[4,7]:= 2;
			tablero[4,8]:= 5;
			tablero[4,9]:= 4;
			tablero[5,1]:= 5;
			tablero[5,2]:= 2;
			tablero[5,3]:= 3;
			tablero[5,4]:= 9;
			tablero[5,5]:= 6;
			tablero[5,6]:= 4;
			tablero[5,7]:= 7;
			tablero[5,8]:= 1;
			tablero[5,9]:= 8;
			tablero[6,1]:= 8;
			tablero[6,2]:= 7;
			tablero[6,3]:= 4;
			tablero[6,4]:= 2;
			tablero[6,5]:= 1;
			tablero[6,6]:= 5;
			tablero[6,7]:= 9;
			tablero[6,8]:= 6;
			tablero[6,9]:= 3;
			tablero[7,1]:= 9;
			tablero[7,2]:= 8;
			tablero[7,3]:= 7;
			tablero[7,4]:= 4;
			tablero[7,5]:= 2;
			tablero[7,6]:= 6;
			tablero[7,7]:= 5;
			tablero[7,8]:= 3;
			tablero[7,9]:= 1;
			tablero[8,1]:= 3;
			tablero[8,2]:= 1;
			tablero[8,3]:= 5;
			tablero[8,4]:= 8;
			tablero[8,5]:= 7;
			tablero[8,6]:= 9;
			tablero[8,7]:= 6;
			tablero[8,8]:= 4;
			tablero[8,9]:= 2;
			tablero[9,1]:= 2;
			tablero[9,2]:= 4;
			tablero[9,3]:= 6;
			tablero[9,4]:= 1;
			tablero[9,5]:= 5;
			tablero[9,6]:= 3;
			tablero[9,7]:= 8;
			tablero[9,8]:= 7;
			tablero[9,9]:= 9;
			
		end;//opc 5 case
		
		
		end;//case
	end;//del procedimiento

	procedure Pistas(tablero: matriz; var tablero_u: matriz);//para generar las posiciones aleatorias de las pistas en el tablero
	var
		contador, fila, columna: Integer;
	begin
		// Inicializa el contador y las pistas
		contador := 0;
		pistas_i := tablero;  // Copia el tablero a las pistas el cual se usa para guardar pistas iniciales y no confundir con numeros ingresados
		tablero_u := tablero;  // Copia el tablero al tablero del usuario
		Randomize;

		while contador < pistas_m do//hace el procedimiento mientras que el contador sea menor al numero de pistas a ocultar
		begin
			fila := Random(N) + 1;
			columna := Random(N) + 1;

			if pistas_i[fila, columna] <> 0 then
			begin
				pistas_i[fila, columna] := 0;
				tablero_u[fila, columna] := 0;  // Oculta la misma celda en el tablero del usuario
				Inc(contador);
			end;
		end;
	end;//del procedimiento

	procedure fila_columna;//para pedirle al usuario en cual fila y columna ingresara el numero.
	begin
	repeat//para validar que es un entero
	repeat//para validar que este entre 1 y 9
		write('Ingrese la fila en la cual desea posicionar su numero 1-9: ');
		readln(val_str);

		n_val := true;
        Val(val_str, f, val_int);

        if val_int <> 0 then
        begin
            writeln('La entrada no es un numero entero. Por favor, intenta de nuevo.');
			writeln('Presione enter para continuar...');
            readln();
            n_val := false; // Establecer n_val en falso para repetir el bucle
        end;
    until n_val;
    
    if (f < 1) or (f > 9) then
	begin
		writeln('La fila seleccionada no es valida. Por favor ingrese una fila valida');
		writeln('Presione enter para continuar...');
            readln();
	end;//del if.
	until (f >= 1) and (f <= 9);
   
    repeat//para validar que es un entero
    repeat//para validar que ente entre 1 y 9
		write('Ingrese la columna en la cual desea posicionar su numero 1-9: ');
		readln(val_str);

		n_val := true;
        Val(val_str, c, val_int);

        if val_int <> 0 then
        begin
            writeln('La entrada no es un numero entero. Por favor, intenta de nuevo.');
            writeln('Presione enter para continuar...');
            readln();
            n_val := false; // Establecer n_val en falso para repetir el bucle
        end;
    until n_val;
    if (c < 1) or (c > 9) then
	begin
		writeln('La columna seleccionada no es valida. Por favor ingrese una columna valida');
		writeln('Presione enter para continuar...');
            readln();
	end;//del if.
	until (c >= 1) and (c <= 9);
	
	end;//de la funcion
	
	function validar(a:string):boolean;//validar si lo ingresado es un numero
	begin
			validar_n := false;

			for i := 1 to Length(a) do//for para verificar que el valor ingresado sea un numero
			begin
				if not (a[i] in ['0'..'9']) then
				begin
					validar_n := true;
					break;
				end;//del if
			end;//del for
			validar:=true;
	end;//de la funcion
	
	procedure menu;//para mostrar un menu
	begin
		ClrScr;
		writeln('|------------------|');
		writeln('|-------Menu-------|');
		writeln('|------------------|');
		writeln('|1. Iniciar juego  |');
		writeln('|                  |');
		writeln('|2. Salir          |');
		writeln('|------------------|');
	end;//del procedimiento	
	
	procedure reglas;//para mostrar reglas de juego
	begin
		ClrScr;
		writeln('|---------------------------------------------------------------------------------------------------------------|');
		writeln('|-----------------------------------------------------Reglas----------------------------------------------------|');
		writeln('|---------------------------------------------------------------------------------------------------------------|');
		writeln('|- Al iniciar, vera un tablero en pantalla con pistas (verdes) las cuales utilizara para resolver el sudoku.    |');
		writeln('|                                                                                                               |');
		writeln('|- No puede ingresar un numero en donde se encuentre una pista.                                                 |');
		writeln('|                                                                                                               |');
		writeln('|- El numero que ingrese no se podra repetir ni en la columna, fila, ni cuadrante del bloque en donde se ubique.|');
		writeln('|                                                                                                               |');
		writeln('|- Si el numero ingresado no va en esa posicion, se marcara rojo y debera cambiarlo.                            |');
		writeln('|                                                                                                               |');
		writeln('|Que disfrute el juego!!!!                                                                                      |');
		writeln('|---------------------------------------------------------------------------------------------------------------|');
		writeln();
		writeln('Presione la tecla enter para continuar...');
		readln();
	end;//procedure
	
	function validar_cant(a,menor,mayor: string): boolean;//valida que un numero ingresado este dentro del rango
	begin
		validar_c:= true;
		if (a < menor) or (a > mayor) then
		begin
			ClrScr;
			writeln('La opcion seleccionada no es valida. Por favor ingrese una opcion valida');
			writeln('Presione enter para continuar...');
            readln();
			validar_c:= false;
		end;//del if.
		validar_cant:= true;
	end;//de la funcion.

	procedure agregar_valor;//para agregar el valor que ingrese el usuario al tablero
	begin
		repeat//para validar que es un entero
		repeat//para validar que este entre 1 y 9
		write('Ingrese el numero que desea agregar al tablero: ');
		readln(val_str);

		n_val := true;
        Val(val_str, v, val_int);

        if val_int <> 0 then
        begin
            writeln('La entrada no es un numero entero. Por favor, intenta de nuevo.');
            writeln('Presione enter para continuar...');
            readln();
            n_val := false; // Establecer n_val en falso para repetir el bucle
        end;
    until n_val;//hasta que n_val verdadero
    
    if (v < 1) or (v > 9) then
	begin
		writeln('El numero ingresado no es valido, por favor ingrese un numero valido.');
		writeln('Presione enter para continuar...');
            readln();
	end;//del if.
	
	if pistas_i[f][c] <> 0 then
	begin
		ClrScr;
		writeln('En esta casilla no puede ingresar números porque hay una pista, intente en una casilla diferente.');
		writeln('Presione enter para continuar...');
            readln();
		exit;  // Sale del procedimiento sin actualizar el tablero del usuario
	end;
	until (v >= 1) and (v <= 9);
		tablero_u[f][c] := v;  // Actualiza el tablero del usuario con el valor ingresado
	end;//del procedimiento
	
	function TableroCompleto(tablero_u: matriz): boolean;//para verificar que el tablero del usuario esta completo y sin errores
	var
		i, j: integer;
	begin
		for i := 1 to 9 do
		begin
			for j := 1 to 9 do
			begin
				if tablero_u[i][j] = 0 then
				begin
					TableroCompleto := false;
					exit;  // Sale de la función si encuentra una celda vacía
				end;
			end;
		end;
		TableroCompleto := true;  // Retorna verdadero si no encuentra ninguna celda vacía
	end;
	
	procedure Datos_usuario;//para pedir los datos del usuario
	var
		Nick,nombre: string;
		validacion_n: boolean;
	begin
		ClrScr;
		repeat
		write('Primero ingrese su nombre: ');
		readln(nombre);
		writeln;
		write('Para continuar ingrese su Nikname de jugador: ');
		readln(Nick);
		validacion_n := false; 

		// Verificar si el nombre y apellido contienen números
		for i := 1 to Length(nombre) do
		begin
			if (not (nombre[i] in ['A'..'Z', 'a'..'z', ' '])) then
			begin
				validacion_n := true;
				break;
			end;
		end;
	
		if  validacion_n then//si hay numeros se muestra el mensaje
		begin
			ClrScr;
			writeln('El nombre no pueden contener numeros, ingrese un nombre valido.');
			writeln('Presione enter para continuar...');
            readln();
		end;
	
		until not validacion_n;
		ClrScr;
		writeln('Bienvenido al RoJeDoku,', Nick, ' a continuacion las reglas:');
		writeln;
		writeln('Presione la tecla enter para continuar...');
		readln();
	
	end;
	
	
begin
	usuario_se_rinde := false;
	tableros_resueltos;//se rellena el tablero
	Pistas(tablero,tablero_u);//se muestran pistas en tablero
	repeat//para validar que es un numero
		repeat//para validar que este en el rango permitido
		menu;//se muestra menu.
		readln(opc_u);//para la opcion que desee el usuario.
		validar(opc_u);//se llama a la funcion para validar que sea un numero.
		if validar_n then
		begin
			writeln('La opcion ingresada no es valida, por favo ingrese una opcion valida.');
			writeln('Presione enter para continuar...');
			readln();
		end;
		until not validar_n;//repetir hasta que sea un numero.
		validar_cant(opc_u, '1','2');//se llama a la funcion para validar que el numero ingresado este en el rango.
	until validar_c;//repetir hasta que este en el rango.
	case opc_u of
	'1':
	begin
		Datos_usuario;//se piden datos de usuario
		reglas;//se muestran reglas
		repeat
			ClrScr;
			tablero_usuario(tablero_u, tablero, pistas_i);//se muestra el tablero
			fila_columna;//se le pide al usuario la fila y la columna del numero juno con su validacion
			agregar_valor;//se le pide al usuario que ingrese el valor a agregar y se valida
			fin:= TableroCompleto(tablero_u);//para validar si el tablero esta completo
		until usuario_se_rinde or fin;//sale del bucle si elige rendirse o si el tablero esta lleno
		if fin then
		begin
			ClrScr;
			writeln('FELICIDADES, USTED HA COMPLETADO EL TABLERO!!');//si lo completa se muestra este mensaje
			tablero_usuario(tablero, tablero, pistas_i);//se muestra el tablero resuelto en caso de rendirse
			writeln('Presione enter para continuar...');
			readln();
		end;
		end//del opc 1 
	else 
	begin
		ClrScr;
		tablero_usuario(tablero, tablero, pistas_i);//se muestra el tablero resuelto en caso de rendirse
		writeln('Presione enter para continuar...');
		readln();
	end;//del else
	end;//del case
	writeln;
	ClrScr;
	writeln('GRACIAS POR JUGAR!!!');//Diosmio porfin terminé
end.//principal
