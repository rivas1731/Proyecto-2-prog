program sudoku;
uses crt;
const
	N = 9;
	pistas_m = 51;
type
	matriz= array[1..9,1..9] of integer;
	cuadrante= array [1..3,1..3] of integer;
var 
	opc, i, j, f, c, val_int, v: integer;
	tablero, tablero_u: matriz;
	val_str, opc_u: string;
	n_val, validar_n, validar_c, esCorrecto, completo, Result: boolean;
	
	procedure tablero_usuario(arreglo:matriz);//para mostrar el tablero
	begin//del rpocedimiento
		writeln('Se muestra tablero a continuacion');
		writeln();
		textcolor(15);
		writeln('----------------------');
		
		for i:= 1 to 9 do
		begin//del for i
			textcolor(9);
			write('|');
			for j:= 1 to 9 do 
			begin//del for j
				if arreglo[i,j] = 0 then
				begin
					write('  ');
				end
				else
				begin
					textcolor(15);
					write(arreglo[i,j], ' ');
				end;
				if (j mod 3 = 0) then
				begin
					textcolor(15);
					write('|');
				end;
			end;//del for j
			writeln();
			textcolor(9);
			if (i mod 3 = 0 ) then
				textcolor(15);
				writeln('----------------------');
		end;//del for i
	end;//del rpocedimiento
	
	
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
			//rellenando tablero del usuario
			tablero_u[1,1]:= 3;
			tablero_u[1,2]:= 9;
			tablero_u[1,3]:= 8;
			tablero_u[1,4]:= 1;
			tablero_u[1,5]:= 5;
			tablero_u[1,6]:= 2;
			tablero_u[1,7]:= 6;
			tablero_u[1,8]:= 4;
			tablero_u[1,9]:= 7;
			tablero_u[2,1]:= 2;
			tablero_u[2,2]:= 1;
			tablero_u[2,3]:= 4;
			tablero_u[2,4]:= 8;
			tablero_u[2,5]:= 6;
			tablero_u[2,6]:= 7;
			tablero_u[2,7]:= 9;
			tablero_u[2,8]:= 5;
			tablero_u[2,9]:= 3;
			tablero_u[3,1]:= 7;
			tablero_u[3,2]:= 6;
			tablero_u[3,3]:= 5;
			tablero_u[3,4]:= 4;
			tablero_u[3,5]:= 9;
			tablero_u[3,6]:= 3;
			tablero_u[3,7]:= 1;
			tablero_u[3,8]:= 2;
			tablero_u[3,9]:= 8;
			tablero_u[4,1]:= 1;
			tablero_u[4,2]:= 3;
			tablero_u[4,3]:= 9;
			tablero_u[4,4]:= 7;
			tablero_u[4,5]:= 2;
			tablero_u[4,6]:= 8;
			tablero_u[4,7]:= 4;
			tablero_u[4,8]:= 6;
			tablero_u[4,9]:= 5;
			tablero_u[5,1]:= 4;
			tablero_u[5,2]:= 8;
			tablero_u[5,3]:= 6;
			tablero_u[5,4]:= 5;
			tablero_u[5,5]:= 3;
			tablero_u[5,6]:= 9;
			tablero_u[5,7]:= 2;
			tablero_u[5,8]:= 7;
			tablero_u[5,9]:= 1;
			tablero_u[6,1]:= 5;
			tablero_u[6,2]:= 7;
			tablero_u[6,3]:= 2;
			tablero_u[6,4]:= 6;
			tablero_u[6,5]:= 4;
			tablero_u[6,6]:= 1;
			tablero_u[6,7]:= 3;
			tablero_u[6,8]:= 8;
			tablero_u[6,9]:= 9;
			tablero_u[7,1]:= 6;
			tablero_u[7,2]:= 2;
			tablero_u[7,3]:= 1;
			tablero_u[7,4]:= 9;
			tablero_u[7,5]:= 8;
			tablero_u[7,6]:= 5;
			tablero_u[7,7]:= 7;
			tablero_u[7,8]:= 3;
			tablero_u[7,9]:= 4;
			tablero_u[8,1]:= 9;
			tablero_u[8,2]:= 5;
			tablero_u[8,3]:= 3;
			tablero_u[8,4]:= 2;
			tablero_u[8,5]:= 7;
			tablero_u[8,6]:= 4;
			tablero_u[8,7]:= 8;
			tablero_u[8,8]:= 1;
			tablero_u[8,9]:= 6;
			tablero_u[9,1]:= 8;
			tablero_u[9,2]:= 4;
			tablero_u[9,3]:= 7;
			tablero_u[9,4]:= 3;
			tablero_u[9,5]:= 1;
			tablero_u[9,6]:= 6;
			tablero_u[9,7]:= 5;
			tablero_u[9,8]:= 9;
			tablero_u[9,9]:= 2;
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
			
			tablero_u[1,1]:= 1;
			tablero_u[1,2]:= 3;
			tablero_u[1,3]:= 6;
			tablero_u[1,4]:= 4;
			tablero_u[1,5]:= 9;
			tablero_u[1,6]:= 2;
			tablero_u[1,7]:= 5;
			tablero_u[1,8]:= 8;
			tablero_u[1,9]:= 7;
			tablero_u[2,1]:= 5;
			tablero_u[2,2]:= 9;
			tablero_u[2,3]:= 4;
			tablero_u[2,4]:= 7;
			tablero_u[2,5]:= 6;
			tablero_u[2,6]:= 8;
			tablero_u[2,7]:= 1;
			tablero_u[2,8]:= 3;
			tablero_u[2,9]:= 2;
			tablero_u[3,1]:= 7;
			tablero_u[3,2]:= 2;
			tablero_u[3,3]:= 8;
			tablero_u[3,4]:= 3;
			tablero_u[3,5]:= 1;
			tablero_u[3,6]:= 5;
			tablero_u[3,7]:= 9;
			tablero_u[3,8]:= 6;
			tablero_u[3,9]:= 4;
			tablero_u[4,1]:= 8;
			tablero_u[4,2]:= 6;
			tablero_u[4,3]:= 1;
			tablero_u[4,4]:= 5;
			tablero_u[4,5]:= 7;
			tablero_u[4,6]:= 4;
			tablero_u[4,7]:= 2;
			tablero_u[4,8]:= 9;
			tablero_u[4,9]:= 3;
			tablero_u[5,1]:= 2;
			tablero_u[5,2]:= 7;
			tablero_u[5,3]:= 5;
			tablero_u[5,4]:= 9;
			tablero_u[5,5]:= 3;
			tablero_u[5,6]:= 1;
			tablero_u[5,7]:= 6;
			tablero_u[5,8]:= 4;
			tablero_u[5,9]:= 8;
			tablero_u[6,1]:= 3;
			tablero_u[6,2]:= 4;
			tablero_u[6,3]:= 9;
			tablero_u[6,4]:= 2;
			tablero_u[6,5]:= 8;
			tablero_u[6,6]:= 6;
			tablero_u[6,7]:= 7;
			tablero_u[6,8]:= 1;
			tablero_u[6,9]:= 5;
			tablero_u[7,1]:= 6;
			tablero_u[7,2]:= 5;
			tablero_u[7,3]:= 7;
			tablero_u[7,4]:= 1;
			tablero_u[7,5]:= 4;
			tablero_u[7,6]:= 3;
			tablero_u[7,7]:= 8;
			tablero_u[7,8]:= 2;
			tablero_u[7,9]:= 9;
			tablero_u[8,1]:= 4;
			tablero_u[8,2]:= 8;
			tablero_u[8,3]:= 2;
			tablero_u[8,4]:= 6;
			tablero_u[8,5]:= 5;
			tablero_u[8,6]:= 9;
			tablero_u[8,7]:= 3;
			tablero_u[8,8]:= 7;
			tablero_u[8,9]:= 1;
			tablero_u[9,1]:= 9;
			tablero_u[9,2]:= 1;
			tablero_u[9,3]:= 3;
			tablero_u[9,4]:= 8;
			tablero_u[9,5]:= 2;
			tablero_u[9,6]:= 7;
			tablero_u[9,7]:= 4;
			tablero_u[9,8]:= 5;
			tablero_u[9,9]:= 6;
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
			
			tablero_u[1,1]:= 2;
			tablero_u[1,2]:= 1;
			tablero_u[1,3]:= 9;
			tablero_u[1,4]:= 5;
			tablero_u[1,5]:= 4;
			tablero_u[1,6]:= 3;
			tablero_u[1,7]:= 6;
			tablero_u[1,8]:= 7;
			tablero_u[1,9]:= 8;
			tablero_u[2,1]:= 5;
			tablero_u[2,2]:= 4;
			tablero_u[2,3]:= 3;
			tablero_u[2,4]:= 8;
			tablero_u[2,5]:= 7;
			tablero_u[2,6]:= 6;
			tablero_u[2,7]:= 9;
			tablero_u[2,8]:= 1;
			tablero_u[2,9]:= 2;
			tablero_u[3,1]:= 8;
			tablero_u[3,2]:= 7;
			tablero_u[3,3]:= 6;
			tablero_u[3,4]:= 2;
			tablero_u[3,5]:= 1;
			tablero_u[3,6]:= 9;
			tablero_u[3,7]:= 3;
			tablero_u[3,8]:= 4;
			tablero_u[3,9]:= 5;
			tablero_u[4,1]:= 4;
			tablero_u[4,2]:= 3;
			tablero_u[4,3]:= 2;
			tablero_u[4,4]:= 7;
			tablero_u[4,5]:= 6;
			tablero_u[4,6]:= 5;
			tablero_u[4,7]:= 8;
			tablero_u[4,8]:= 9;
			tablero_u[4,9]:= 1;
			tablero_u[5,1]:= 7;
			tablero_u[5,2]:= 6;
			tablero_u[5,3]:= 5;
			tablero_u[5,4]:= 1;
			tablero_u[5,5]:= 9;
			tablero_u[5,6]:= 8;
			tablero_u[5,7]:= 2;
			tablero_u[5,8]:= 3;
			tablero_u[5,9]:= 4;
			tablero_u[6,1]:= 1;
			tablero_u[6,2]:= 9;
			tablero_u[6,3]:= 8;
			tablero_u[6,4]:= 4;
			tablero_u[6,5]:= 3;
			tablero_u[6,6]:= 2;
			tablero_u[6,7]:= 5;
			tablero_u[6,8]:= 6;
			tablero_u[6,9]:= 7;
			tablero_u[7,1]:= 3;
			tablero_u[7,2]:= 2;
			tablero_u[7,3]:= 1;
			tablero_u[7,4]:= 6;
			tablero_u[7,5]:= 5;
			tablero_u[7,6]:= 4;
			tablero_u[7,7]:= 7;
			tablero_u[7,8]:= 8;
			tablero_u[7,9]:= 9;
			tablero_u[8,1]:= 6;
			tablero_u[8,2]:= 5;
			tablero_u[8,3]:= 4;
			tablero_u[8,4]:= 9;
			tablero_u[8,5]:= 8;
			tablero_u[8,6]:= 7;
			tablero_u[8,7]:= 1;
			tablero_u[8,8]:= 2;
			tablero_u[8,9]:= 3;
			tablero_u[9,1]:= 9;
			tablero_u[9,2]:= 8;
			tablero_u[9,3]:= 7;
			tablero_u[9,4]:= 3;
			tablero_u[9,5]:= 2;
			tablero_u[9,6]:= 1;
			tablero_u[9,7]:= 4;
			tablero_u[9,8]:= 5;
			tablero_u[9,9]:= 6;
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
			
			tablero_u[1,1]:= 7;
			tablero_u[1,2]:= 6;
			tablero_u[1,3]:= 1;
			tablero_u[1,4]:= 3;
			tablero_u[1,5]:= 4;
			tablero_u[1,6]:= 9;
			tablero_u[1,7]:= 8;
			tablero_u[1,8]:= 2;
			tablero_u[1,9]:= 5;
			tablero_u[2,1]:= 3;
			tablero_u[2,2]:= 8;
			tablero_u[2,3]:= 2;
			tablero_u[2,4]:= 7;
			tablero_u[2,5]:= 5;
			tablero_u[2,6]:= 1;
			tablero_u[2,7]:= 6;
			tablero_u[2,8]:= 9;
			tablero_u[2,9]:= 4;
			tablero_u[3,1]:= 5;
			tablero_u[3,2]:= 9;
			tablero_u[3,3]:= 4;
			tablero_u[3,4]:= 2;
			tablero_u[3,5]:= 8;
			tablero_u[3,6]:= 6;
			tablero_u[3,7]:= 7;
			tablero_u[3,8]:= 3;
			tablero_u[3,9]:= 1;
			tablero_u[4,1]:= 6;
			tablero_u[4,2]:= 2;
			tablero_u[4,3]:= 5;
			tablero_u[4,4]:= 9;
			tablero_u[4,5]:= 7;
			tablero_u[4,6]:= 3;
			tablero_u[4,7]:= 4;
			tablero_u[4,8]:= 1;
			tablero_u[4,9]:= 8;
			tablero_u[5,1]:= 8;
			tablero_u[5,2]:= 3;
			tablero_u[5,3]:= 7;
			tablero_u[5,4]:= 6;
			tablero_u[5,5]:= 1;
			tablero_u[5,6]:= 4;
			tablero_u[5,7]:= 9;
			tablero_u[5,8]:= 5;
			tablero_u[5,9]:= 2;
			tablero_u[6,1]:= 4;
			tablero_u[6,2]:= 1;
			tablero_u[6,3]:= 9;
			tablero_u[6,4]:= 5;
			tablero_u[6,5]:= 2;
			tablero_u[6,6]:= 8;
			tablero_u[6,7]:= 3;
			tablero_u[6,8]:= 7;
			tablero_u[6,9]:= 6;
			tablero_u[7,1]:= 9;
			tablero_u[7,2]:= 4;
			tablero_u[7,3]:= 3;
			tablero_u[7,4]:= 1;
			tablero_u[7,5]:= 6;
			tablero_u[7,6]:= 5;
			tablero_u[7,7]:= 2;
			tablero_u[7,8]:= 8;
			tablero_u[7,9]:= 7;
			tablero_u[8,1]:= 2;
			tablero_u[8,2]:= 5;
			tablero_u[8,3]:= 8;
			tablero_u[8,4]:= 4;
			tablero_u[8,5]:= 9;
			tablero_u[8,6]:= 7;
			tablero_u[8,7]:= 1;
			tablero_u[8,8]:= 6;
			tablero_u[8,9]:= 3;
			tablero_u[9,1]:= 1;
			tablero_u[9,2]:= 7;
			tablero_u[9,3]:= 6;
			tablero_u[9,4]:= 8;
			tablero_u[9,5]:= 3;
			tablero_u[9,6]:= 2;
			tablero_u[9,7]:= 5;
			tablero_u[9,8]:= 4;
			tablero_u[9,9]:= 9;
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
			
			tablero_u[1,1]:= 4;
			tablero_u[1,2]:= 6;
			tablero_u[1,3]:= 2;
			tablero_u[1,4]:= 5;
			tablero_u[1,5]:= 9;
			tablero_u[1,6]:= 1;
			tablero_u[1,7]:= 3;
			tablero_u[1,8]:= 8;
			tablero_u[1,9]:= 7;
			tablero_u[2,1]:= 1;
			tablero_u[2,2]:= 3;
			tablero_u[2,3]:= 9;
			tablero_u[2,4]:= 6;
			tablero_u[2,5]:= 8;
			tablero_u[2,6]:= 7;
			tablero_u[2,7]:= 4;
			tablero_u[2,8]:= 2;
			tablero_u[2,9]:= 5;
			tablero_u[3,1]:= 7;
			tablero_u[3,2]:= 5;
			tablero_u[3,3]:= 8;
			tablero_u[3,4]:= 3;
			tablero_u[3,5]:= 4;
			tablero_u[3,6]:= 2;
			tablero_u[3,7]:= 1;
			tablero_u[3,8]:= 9;
			tablero_u[3,9]:= 6;
			tablero_u[4,1]:= 6;
			tablero_u[4,2]:= 9;
			tablero_u[4,3]:= 1;
			tablero_u[4,4]:= 7;
			tablero_u[4,5]:= 3;
			tablero_u[4,6]:= 8;
			tablero_u[4,7]:= 2;
			tablero_u[4,8]:= 5;
			tablero_u[4,9]:= 4;
			tablero_u[5,1]:= 5;
			tablero_u[5,2]:= 2;
			tablero_u[5,3]:= 3;
			tablero_u[5,4]:= 9;
			tablero_u[5,5]:= 6;
			tablero_u[5,6]:= 4;
			tablero_u[5,7]:= 7;
			tablero_u[5,8]:= 1;
			tablero_u[5,9]:= 8;
			tablero_u[6,1]:= 8;
			tablero_u[6,2]:= 7;
			tablero_u[6,3]:= 4;
			tablero_u[6,4]:= 2;
			tablero_u[6,5]:= 1;
			tablero_u[6,6]:= 5;
			tablero_u[6,7]:= 9;
			tablero_u[6,8]:= 6;
			tablero_u[6,9]:= 3;
			tablero_u[7,1]:= 9;
			tablero_u[7,2]:= 8;
			tablero_u[7,3]:= 7;
			tablero_u[7,4]:= 4;
			tablero_u[7,5]:= 2;
			tablero_u[7,6]:= 6;
			tablero_u[7,7]:= 5;
			tablero_u[7,8]:= 3;
			tablero_u[7,9]:= 1;
			tablero_u[8,1]:= 3;
			tablero_u[8,2]:= 1;
			tablero_u[8,3]:= 5;
			tablero_u[8,4]:= 8;
			tablero_u[8,5]:= 7;
			tablero_u[8,6]:= 9;
			tablero_u[8,7]:= 6;
			tablero_u[8,8]:= 4;
			tablero_u[8,9]:= 2;
			tablero_u[9,1]:= 2;
			tablero_u[9,2]:= 4;
			tablero_u[9,3]:= 6;
			tablero_u[9,4]:= 1;
			tablero_u[9,5]:= 5;
			tablero_u[9,6]:= 3;
			tablero_u[9,7]:= 8;
			tablero_u[9,8]:= 7;
			tablero_u[9,9]:= 9;
		end;//opc 5 case
		
		
	end;//case
	end;//del procedimiento

	procedure pistas;//para mostrar pistas de forma aleatoria
	var
		contador, fila, columna: Integer;
	begin
		// Inicializa el contador y oculta pistas aleatorias
		contador := 0;
		Randomize;

		while contador < pistas_m do
		begin
			fila := Random(N) + 1;
			columna := Random(N) + 1;
	
			if tablero_u[fila, columna] <> 0 then
			begin
				tablero_u[fila, columna] := 0;
				Inc(contador);
			end;
		end;
	end;

	procedure fila_columna;//para pedirle al usuario en cual fila y columna ingresara el numero.
	begin
	repeat//para validar que es un entero
	repeat//para validar que este entre 1 y 9
		writeln('Ingrese la fila en la cual desea posicionar su numero 1-9: ');
		readln(val_str);

		n_val := true;
        Val(val_str, f, val_int);

        if val_int <> 0 then
        begin
            writeln('La entrada no es un numero entero. Por favor, intenta de nuevo.');
            n_val := false; // Establecer n_val en falso para repetir el bucle
        end;
    until n_val;
    
    if (f < 1) or (f > 9) then
	begin
		writeln('La fila seleccionada no es valida. Por favor ingrese una fila valida');
	end;//del if.
	until (f >= 1) and (f <= 9);
   
    repeat//para validar que es un entero
    repeat//para validar que ente entre 1 y 9
		writeln('Ingrese la columna en la cual desea posicionar su numero 1-9: ');
		readln(val_str);

		n_val := true;
        Val(val_str, c, val_int);

        if val_int <> 0 then
        begin
            writeln('La entrada no es un numero entero. Por favor, intenta de nuevo.');
            n_val := false; // Establecer n_val en falso para repetir el bucle
        end;
    until n_val;
    if (c < 1) or (c > 9) then
	begin
		writeln('La columna seleccionada no es valida. Por favor ingrese una columna valida');
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
	
	procedure menu;
	begin
		writeln('--------------------');
		writeln('|1. Iniciar juego  |');
		writeln('|2. Salir          |');
		writeln('--------------------');
	end;//del procedimiento	
	
	procedure reglas;
	begin
		writeln('Bienvenido al RoJeDoku, a continuacion las reglas:');
		writeln('- Al iniciar, vera un tablero en pantalla con pistas las cuales utilizara para resolver el sudoku.');
		writeln('- No puede ingresar un numero en donde se encuentre una pista.');
		writeln('- El numero que ingrese no se podra repetir ni en la columna, fila, ni cuadrante del bloque en donde se ubique.');
		writeln('- Si el numero ingresado no va en esa posicion, se marcara rojo y debera cambiarlo.');
		writeln('Que disfrute el juego!!!!');
		writeln();
		writeln('Presione la tecla enter para continuar...');
		readln();
	end;//procedure
	
	function validar_cant(a,x,y: string): boolean;//valida que un numero ingresado este dentro del rango
	begin
		validar_c:= true;
		if (a < x) or (a > y) then
		begin
			writeln('La opcion seleccionada no es valida. Por favor ingrese una opcion valida');
			validar_c:= false;
		end;//del if.
		validar_cant:= true;
	end;//de la funcion.

	procedure agregar_valor;//para agregar el valor que ingrese el usuario al tablero
	begin
		repeat//para validar que es un entero
		repeat//para validar que este entre 1 y 9
		writeln('Ingrese el numero que desea agregar al tablero');
		readln(val_str);

		n_val := true;
        Val(val_str, v, val_int);

        if val_int <> 0 then
        begin
            writeln('La entrada no es un numero entero. Por favor, intenta de nuevo.');
            n_val := false; // Establecer n_val en falso para repetir el bucle
        end;
    until n_val;
    
    if (v < 1) or (v > 9) then
	begin
		writeln('El numero ingresado no es valido, por favor ingrese un numero valido.');
	end;//del if.
	until (v >= 1) and (v <= 9);
	
	tablero_u[f,c]:= v;
		
		
	end;//del procedimiento
	
	
	
	function CompararTableros(var tablero, tablero_u: matriz): boolean;
	var
	i, j: integer;
	begin
		Result := true;
		for i := Low(tablero) to High(tablero) do
		begin
			for j := Low(tablero[i]) to High(tablero[i]) do
			begin
				if tablero_u[i, j] <> tablero[i, j] then
				begin
					Result := false;
					exit;
				end;
			end;
		end;
	end;
	
	
	
	
	function EstaCompleto(var tablero_u: matriz): boolean;
	var
	i, j: integer;
	
	begin
		for i := Low(tablero_u) to High(tablero_u) do
		begin
			for j := Low(tablero_u[i]) to High(tablero_u[i]) do
			begin
			if tablero_u[i, j] = 0 then
			begin
				Result := false;
				exit;
			end;
		end;
	end;
	Result := true;
	end;
	
	
	
	
	
	
	
	
begin//principal
	repeat
	repeat
		menu;//se muestra menu.
		readln(opc_u);//para la opcion que desee el usuario.
		validar(opc_u);//se llama a la funcion para validar que sea un numero.
		if validar_n then
		begin
			writeln('La opcion ingresada no es valida, por favo ingrese una opcion valida.');
		end;
		until not validar_n;//repetir hasta que sea un numero.

	validar_cant(opc_u, '1','2');//se llama a la funcion para validar que el numero ingresado este en el rango.
	until validar_c;//repetir hasta que este en el rango.
	reglas;
	
	tableros_resueltos;
	tablero_usuario(tablero);
	pistas;
	repeat
	tablero_usuario(tablero_u);
	fila_columna;
	agregar_valor;
	
	completo := EstaCompleto(tablero_u);

    if completo then
    begin
		esCorrecto:= CompararTableros(tablero, tablero_u);
	end;
	
	until esCorrecto and completo;
	
	
end.//principal
