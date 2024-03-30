program untitled;
{$codepage UTF8}
uses crt,sysutils;
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
	nombre:string;
	apellido:string;
	prestados: string;
	limite:integer;
	ID:longint;
end;
	
var
Horas, Minutos: Integer;
valname,valastname,valCI:boolean;
registros:array [1..80] of registro;
Biblioteca:array [1..40] of catalogo;
prestamo: array  [1..80] of sacados;

procedure regisalum();
var 
a,m: integer;
const
i:integer=0;

BEGIN
	if i<80 then
	begin
	i:=i+1;
		repeat
			Begin
				//El ingreso del nombre
				Writeln('Ingrese su nombre:');
				readln(registros[i].name);
				clrscr;
				valname:=true;
                   if ((registros[i].name='') or (not(registros[i].name[1] in ['A'..'Z']))) then //Si la entrada es vacia o la primera letra no es mayuscula, no lo acepta.
                   begin
                       valname:=false;
                       writeln('Datos del nombre no válidos, debes comenzar en mayúscula y evitar los números');
                       delay(5000);
                   end
                   else begin
                       for a:=2 to length(registros[i].name) do
                       begin
                           if not (registros[i].name[a] in ['a'..'z']) then //Si la entrada tiene numeros, caracteres especiales o una mayuscula en el medio, no lo acepta.
                           begin
                               valname:=false;
                               writeln('Datos del nombre no válidos, debes comenzar en mayúscula y evitar los números');
                               delay(5000);
                               break; //Si consigue uno, no hace falta revisar el resto.
                           end;
                       end;
                   end;
				End;
				clrscr;
			  until valname;
	  repeat
		Begin
			writeln('Ingrese su apellido:');
			readln(registros[i].lastname);
			clrscr;
			valastname:=true;
			   if ((registros[i].lastname='') or (not(registros[i].lastname[1] in ['A'..'Z']))) then //Si la entrada es vacia o la primera letra no es mayuscula, no lo acepta.
			   begin
				   valastname:=false;
				   writeln('Datos del apellido no válidos, debes comenzar en mayúscula y evitar los números');
				   delay(5000);
			   end
			   else begin
				   for a:=2 to length(registros[i].lastname) do
				   begin
					   if not (registros[i].lastname[a] in ['a'..'z']) then //Si la entrada tiene numeros, caracteres especiales o una mayuscula en el medio, no lo acepta.
					   begin
						   valastname:=false;
						   writeln('Datos del apellido no válidos, debes comenzar en mayúscula y evitar los números');
						   delay(5000);
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
			writeln('Cédula de identidad falsa o caracter no permitido, vuelva a introducir su cedula');
			delay(5000);
			clrscr;
		end
		else
		Begin
			writeln('Cédula de identidad aceptada');
			delay(2000);
			clrscr;
			Writeln('Ahora se esta haciendo una revision de si ese cédula existe no tardaremos...');
			delay(4000);
			clrscr;
			for m:=0 to i-1 do
			begin
				if registros[m].cedula <> registros[i].cedula then
				Begin
					Writeln('espere...');
					delay(2000);
					clrscr;
				end
				else
				Begin
					writeln('Cédula de identidad ya registradan, ingrese otra para poder registrase');
					delay(5000);
					clrscr;
					break;
				end;
			end;	
		end;
		until (valCI) and (registros[m].cedula <> registros[i].cedula) ;
		writeln('Su registro ha sido completado');
		writeln();
		Writeln('Su ID siempre sera su numero de cedula, si quiere pedir un prestamo de un libro o trabajo');
		delay(5000);
		clrscr;
	end
	else
	Begin
		writeln('Nuestro registro esta lleno por el momento');
	end;
		
	
END;

procedure revislibtra(var Biblioteca: array of catalogo; prestamo: array of sacados);
var
  i: integer;

begin
  for i := 1 to 40 do
  begin
    Biblioteca[i].trabajos := '';
  end;

	Biblioteca[1].libros:='Frankenstein';
	Biblioteca[2].libros:='Cien años de soledad';
	Biblioteca[3].libros:='Los viajes de Gulliver';
	Biblioteca[4].libros:='El Principito';
	Biblioteca[5].libros:='Don Quijote de la Mancha';
	Biblioteca[6].libros:='Alicia en el país de las maravillas';
	Biblioteca[7].libros:='Moby Dick';
	Biblioteca[8].libros:='Los miserables';
	Biblioteca[9].libros:='Drácula';
	Biblioteca[10].libros:='El código Da Vinci';
	Biblioteca[11].libros:='Las crónicas de Narnia';
	Biblioteca[12].libros:='La Biblia';
	Biblioteca[13].libros:='La divina comedia';
	Biblioteca[14].libros:='Crepúsculo';
	Biblioteca[15].libros:='Fahrenheit 451';
	Biblioteca[16].libros:='Crónica de una muerte anunciada';
	Biblioteca[17].libros:='El juego de Ender';
	Biblioteca[18].libros:='El amor en los tiempos del cólera';
	Biblioteca[19].libros:='El gran Gatsby';
	Biblioteca[20].libros:='En busca del tiempo perdido';
	
	Writeln('Tenemos los siguientes trabajos y libros disponibles');
	for i := 1 to 80 do
		begin
			if CompareStr(Biblioteca[i].libros, prestamo[i].prestados) = 0 then
				begin
				end
			else
				begin
					Writeln(i, ' ', Biblioteca[i].libros,' ',i, ' ', Biblioteca[i].trabajos);
				end;
		end;
end;

procedure newbook(var Biblioteca: array of catalogo);
var
opcion: char;
i,l:integer;

BEGIN
	i:=20;
	l:=0;
	
		repeat
		Begin
			Writeln('¿Quiere agregarlo como trabajo o libro?, si es libro presione "l" o si es trabajo presione "t"');
			readln(opcion); 
			case opcion of
				'l': Begin
					if i<40 then
					begin
						i:= i + 1;
						writeln('Aun tenemos espacio para almacenar su libro, diganos el nombre de su libro');
						readln(Biblioteca[i].libros);
						clrscr;
						Writeln('Ahora el libro ',Biblioteca[i].libros ,' esta en nuestro biblioteca disponible');
						delay(2000);
					End
					else
					Begin
						Writeln('Nuestros archivos estan llenos');
					end;
				end;
				't': Begin
					if l<40 then
					Begin
						l:= l + 1;
						writeln('Aun tenemos espacio para almacenar su libro');
						readln(Biblioteca[i].trabajos);
						clrscr;
						Writeln('Ahora el trabajo ',Biblioteca[l].trabajos ,' esta en nuestro biblioteca disponible');
						delay(2000);
					End
					else
					Begin
						Writeln('Nuestros archivos estan llenos');
					end;
				end
				else
				Begin
						Writeln('opcion no exitente');
				end;
			end;	
		end;
		until (opcion='t') or (opcion='T') or (opcion='l') or (opcion='L');	
END;

procedure registrablib (var registros:array of registro; prestamo: array of sacados);
var
a,m,eleccion:integer;
ID:longint;
valID: boolean;
opcion: char;
const
l: integer = 0;


BEGIN
	if (length(registros)> 0) then
	Begin
		repeat
		Begin
			writeln('Escriba su ID');
			readln(ID);
			valID:=true;
			if (ID<1000000) or (ID>100000000)then
			Begin
				valID:=false;
				writeln('ID o caracter no permitido, vuelva a introducir su cedula debe encontrase entre un millón  cien millones');
				delay(5000);
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
				writeln('Bienvenido, escriba el nombre del libro o trabajo quiere pedir prestado de nuestro biblioteca');
				opcion:=' ';
				l:=l+1;
				repeat
				Begin
					revislibtra(Biblioteca, prestamo);
					readln(eleccion);
					clrscr;
					prestamo[l].prestados := Biblioteca[eleccion].libros;
					for m:= 0 to l-1 do
					if CompareStr(prestamo[l].prestados, prestamo[m].prestados) = 0 then
					begin
						writeln('El libro ya está prestado.');
						writeln('¿Desea elegir otro libro? (s/n)');
						readln(opcion);
						clrscr;
					end
					else
					begin
						writeln('Prestamo aprobado, tiene hasta tres días para devolverlo sino será sancionado');
						delay(5000);
						clrscr;
						break;
					end;
				end;
				until (not (CompareStr(prestamo[m].prestados, prestamo[l].prestados) = 0)) or (opcion = 'n');
				break;
			end
			else
			Begin
				Writeln('Espere...');
				delay(200);
				clrscr;
			end;
		end;
		if registros[a].cedula<>ID then
		Begin
			Writeln('ID no existente, vuelva a intentarlo y sino vaya a la opcion de registro y registres');
			delay(5000);
			clrscr;
		end
		else
		Begin
			writeln();
		end;
	end
	else
	Begin
		writeln('No hay registros');
	end;
END;

procedure AvanzarReloj();
begin
	Minutos := Minutos + 15;
	if Minutos >= 60 then
		begin
			Minutos := Minutos - 60;
			Horas := Horas + 1;
			if Horas >= 24 then
				Horas := 0;
		end;
end;


var
opcion: char;
HoraActual, MinutoActual: Integer;

BEGIN
		Horas := 8;
		Minutos := 15;
	repeat
	begin
		AvanzarReloj;
	    HoraActual := Horas;
		MinutoActual := Minutos;
		writeln('Hora Actual: ', Horas, ':', Minutos);
		writeln('Escriba el número de la acción que quieres realizar');
		writeln();
		writeln('1. Registrarse');
		writeln('2. Sacar un libro');
		Writeln('3. Revisar los libros disponibles');
		Writeln('4. Ingresar un nuevo libros');
		writeln('0. Salir');
		writeln();
		readln(opcion);
		clrscr;
		case opcion of
			'1': begin
					regisalum;
				End;
			'2': begin
					registrablib(registros, prestamo);
				end;
			'3': Begin
					revislibtra (Biblioteca, prestamo);
				end;
			'4': Begin
					newbook(Biblioteca);
				end;
			'0': Begin
				writeln('Se va a cerrar sesión');
				end
			else
			Begin
				writeln('No existe esa opción');
				readln();
				clrscr;
			End;
		end;
	end;
	if (HoraActual=16) and (MinutoActual=30) then
	begin
		writeln('Ya son las 16:30, es hora de cerrar la biblioteca por hoy');
		break;
	end;
	until (opcion ='0') or (HoraActual=16) and (MinutoActual=30);		
	
	
END.

