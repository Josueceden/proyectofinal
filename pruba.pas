program untitled;

uses crt;
type
registro =record
	name: string;
	lastname:string;
	cedula: longint;
	end;
catalogo=record
	trabajos: string;
	libros:string;
	end;
	
sacados = record
	prestados: string;
end;
	
var
valname,valastname,valCI:boolean;
registros:array [1..500] of registro;
Biblioteca:array [1..40] of catalogo;
prestamo: array  [1..80] of sacados;

procedure regisalum();
var 
a: integer;
const
i:integer=0;
BEGIN
	if i<500 then
	begin
	i:=i+1;
		repeat
			Begin
				//El ingreso del nombre
				Writeln('Ingrese su nombre');
				readln(registros[i].name);
				clrscr;
				valname:=true;
                   if ((registros[i].name='') or (not(registros[i].name[1] in ['A'..'Z']))) then //Si la entrada es vacia o la primera letra no es mayuscula, no lo acepta.
                   begin
                       valname:=false;
                       writeln('Datos del nombre no validos, debes comenzar en mayuscula y evitar los numeros');
                       delay(2000);
                   end
                   else begin
                       for a:=2 to length(registros[i].name) do
                       begin
                           if not (registros[i].name[a] in ['a'..'z']) then //Si la entrada tiene numeros, caracteres especiales o una mayuscula en el medio, no lo acepta.
                           begin
                               valname:=false;
                               writeln('Datos del nombre no validos, debes comenzar en mayuscula y evitar los numeros');
                               delay(2000);
                               break; //Si consigue uno, no hace falta revisar el resto.
                           end;
                       end;
                   end;
				End;
				clrscr;
			  until valname;
	  repeat
		Begin
			writeln('Escriba su apellido a registrar');
			readln(registros[i].lastname);
			clrscr;
			valastname:=true;
			   if ((registros[i].lastname='') or (not(registros[i].lastname[1] in ['A'..'Z']))) then //Si la entrada es vacia o la primera letra no es mayuscula, no lo acepta.
			   begin
				   valastname:=false;
				   writeln('Datos del nombre no validos, debes comenzar en mayuscula y evitar los numeros');
				   delay(2000);
			   end
			   else begin
				   for a:=2 to length(registros[i].lastname) do
				   begin
					   if not (registros[i].lastname[a] in ['a'..'z']) then //Si la entrada tiene numeros, caracteres especiales o una mayuscula en el medio, no lo acepta.
					   begin
						   valastname:=false;
						   writeln('Datos del nombre no validos, debes comenzar en mayuscula y evitar los numeros');
						   delay(2000);
						   break; //Si consigue uno, no hace falta revisar el resto.
					   end;
				   end;
			   end;
		End;
		clrscr;
	  until valastname;
	  repeat
		writeln('Escriba su cedula de identidad');
		readln(registros[i].cedula);
		valCI:=true;
		if (registros[i].cedula<1000000) or (registros[i].cedula>100000000)then
		Begin
			valCI:=false;
			writeln('Cedula de identidad falsa o caracter no permitido, vuelva a introducir su cedula');
			delay(2000);
			clrscr;
		end
		else
		Begin
			writeln('Cedula de identidad aceptada');
			delay(2000);
			clrscr;
		end;
		until valCI;
		Writeln('Su registro ha sido completado');
		writeln();
		Writeln('Su ID siempre sera su numero de cedula, si quiere pedir un prestamo de un libro o trabajo');
	end
	else
	Begin
		writeln('Nuestro registro esta lleno por el momento');
	end;
		
	
END;

procedure registrablib (var registros:array of registro; prestamo: array of sacados);
var
a,f,k,m,l:integer;
ID:longint;
valID, valprestamo: boolean;
sacar:string;


BEGIN
	l:=0;
	if (length(registros)= 0) then
	Begin
		writeln('No exiten datos');
		delay(2000);
		clrscr;
	end
	else
	Begin
		repeat
		Begin
			writeln('Escriba su ID');
			readln(ID);
			valID:=true;
			if (ID<1000000) or (ID>100000000)then
			Begin
				valID:=false;
				writeln('ID o caracter no permitido, vuelva a introducir su cedula');
				delay(2000);
				clrscr;
			end
			else
			Begin
				writeln('ID aceptada');
				delay(2000);
				clrscr;
			end;
		end;
		until valID;
		for a:= 0 to length(registros)-1 do
		begin
			if (registros[a].cedula=ID) then
			begin
				writeln('Bienvenido, escriba el nombre del libro o trabajo quiere pedir prestado de nuestro catalogo');
				repeat
				Begin
					for f:=1 to length(Biblioteca)-1 do
					Begin
						Writeln(f,'',Biblioteca[f].libros,' ',f,'',Biblioteca[f].trabajos);
					end;
					readln(sacar);
					clrscr;
					valprestamo:=true;
					if ((sacar='') or (not(sacar[1] in ['A'..'Z']))) then //Si la entrada es vacia o la primera letra no es mayuscula, no lo acepta.
					   begin
						   valprestamo:=false;
						   writeln('Datos del libro del prestamo no validos, debes comenzar en mayuscula y evitar los numeros');
						   delay(2000);
					   end
					   else
					   begin
						   for k:=2 to length(sacar) do
						   begin
							   if not (sacar[k] in ['a'..'z']) then //Si la entrada tiene numeros, caracteres especiales o una mayuscula en el medio, no lo acepta.
							   begin
								   valprestamo:=false;
								   writeln('Datos del libro de prestamo no validos, debes comenzar en mayuscula y evitar los numeros');
								   delay(2000);
								   break; //Si consigue uno, no hace falta revisar el resto.
							   end;
						   end;
					   end;
					End;
				until valprestamo;
				if l=0 then
				Begin
					l:=l+1;
					prestamo[l].prestados:= sacar;
				End
				else if l=80 then
				Begin
					writeln('Lo lamentamos, pero ya se han hecho prestamo de todos los trabajos y libros disponibles');
				end
				else
				Begin
					for m:=1 to l do
					if prestamo[m].prestados = sacar then
					Begin
						Writeln('El libro que esta pidiendo ya esta prestado, puede venir otro dia a ver si ya fue devuelto');
					end
					else
					Begin
						l:=l+1;
						prestamo[l].prestados:= sacar;
					end;
				end;	
			end
			else
			Begin
				Writeln('Su ID, no se encuentra en nuestra base de datos vaya a registrase a la opcion de registro');
				clrscr;
			end;
		end;
	end;
END;

var
opcion: char;

BEGIN
	repeat
	Begin
		writeln('Elige que accion quieres realizar');
		writeln('1. Registrarse');
		writeln('2.Sacar un libro');
		writeln('0. Salir');
		readln(opcion);
		case opcion of
			'1': begin
					regisalum;
				End;
			'2': begin
					registrablib(registros, prestamo);
				end;
			'0': Begin
				writeln('Se va a cerrrar sesion');
				end
			else
			Begin
				writeln('No existe esa opcion');
			End;
		end;
	end;
	until opcion ='0';		
	
	
END.

