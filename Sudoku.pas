program sudoku;
uses crt;
type
	matriz= array[1..9,1..9] of integer;
	cuadrante= array [1..3,1..3] of integer;
var 
	i,j: integer;
	tablero: matriz;
	cuadrantes: cuadrante;
begin
	for i:=1 to 3 do //rellenando cuadrante de 0
	begin
		for j:= 1 to 3 do
		begin
			cuadrantes[i,j]:= 0;
		end;
	end;
	
	
	
	for i:= 1 to 9 do//creando el tablero
	begin
		for j:= 1 to 9 do
		begin
			tablero[i,j]:= cuadrantes[1,1];
		end;
	end;
	
		for i:= 1 to 9 do
	begin 
		writeln;
		for j:= 1 to 9 do
		begin
			write(tablero[i,j], ' ');
		end;
	end;
end.
