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
	name:string;
	lastname:string;
	prestados: string;
	dias:real;
	ID:longint;
end;
    lista = record
        name: string;
        lastname: string;
        dias: real;
        prestado: string;
        ID: longint;
    end;
 

var
Horas, Minutos: Integer;
valname,valastname,valCI:boolean;
registros:array [1..80] of registro;
Biblioteca:array [1..40] of catalogo;
prestamo: array  [1..80] of sacados;
sanciones: array [1..80] of lista;
const
contadorprestamos:integer=0;

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
	Biblioteca[1].trabajos:='El rol del mediador en la mediación judicial';
	Biblioteca[2].trabajos:='El juego para la enseñanza de las matemáticas';
	Biblioteca[3].trabajos:='El uso de hormigón reciclado en la construcción';
	Biblioteca[4].trabajos:='Los tratamientos efectivos para los ataques de pánico';
	Biblioteca[5].trabajos:='El rol fundamental del periodismo en el cuidado del medioambiente';
	Biblioteca[6].trabajos:='La crónica literaria como alternativa al periodismo tradicional';
	Biblioteca[7].trabajos:='La recuperación de deportistas de alto rendimiento que han sufrido una lesión';
	Biblioteca[8].trabajos:='Análisis comparado de democracias federalistas';
	Biblioteca[9].trabajos:='Impresión 3D para fabricación de prótesis';
	Biblioteca[10].trabajos:='La comunicación horizontal y la comunicación vertical en relación con la eficiencia';
	
	Writeln('Tenemos los siguientes libros disponibles');
	for i := 1 to length(Biblioteca)-1 do
		begin
			
			if (Biblioteca[i].libros= '') and (CompareStr(Biblioteca[i].libros, prestamo[i].prestados) = 0) then
				begin
				end
			else
				begin
					Writeln(i, ' ', Biblioteca[i].libros);
				end;
		end;
	delay(7000);
	clrscr;
	Writeln('Tenemos los siguientes trabajos disponibles');
	for i := 1 to length(Biblioteca)-1 do
		begin
			if (Biblioteca[i].trabajos= '') and (CompareStr(Biblioteca[i].trabajos, prestamo[i].prestados) = 0) then
				begin
				end
			else
				begin
					Writeln(i, ' ', Biblioteca[i].trabajos);
				end;
		end;
	Delay(7000);
	clrscr;	
end;

procedure newbook(var Biblioteca: array of catalogo);
const
l:integer=10;
i:integer=20;

var
opcion: char;

BEGIN
		repeat
		Begin
			Writeln('¿Quiere agregarlo como trabajo o libro?, si es libro presione "l" o si es trabajo presione "t"');
			readln(opcion); 
			case opcion of
				'l': Begin
					if i<40 then
					begin
						i:= i + 1;
						writeln('Aun tenemos espacio para almacenar su libro, escriba el nombre del libro');
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
						writeln('Aun tenemos espacio para almacenar su trabajo, escriba el nombre del trabajo');
						readln(Biblioteca[l].trabajos);
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

procedure registrablib (var registros:array of registro; prestamo: array of sacados; contadorprestamos:integer);
var
a,m,eleccion,posicion:integer;
ID:longint;
valID: boolean;
opcion,opcion2: char;



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
				posicion:=a;
				writeln(registros[posicion].name);
				writeln(registros[posicion].lastname);
				writeln(registros[posicion].cedula);
				readln;
				writeln('Bienvenido, escriba el nombre del libro o trabajo quiere pedir prestado de nuestro biblioteca');
				opcion:=' ';
				contadorprestamos:=contadorprestamos+1;
				repeat
				Begin
					prestamo[contadorprestamos].name := registros[posicion].name;
					prestamo[contadorprestamos].lastname:=registros[posicion].lastname;
					prestamo[contadorprestamos].ID:=registros[posicion].cedula;
					prestamo[contadorprestamos].dias:=3;
					revislibtra(Biblioteca, prestamo);
					writeln('De lo mostrado, que quiere pedir prestado "l" para libros y "t" para trabajos');
					readln(opcion2);
					repeat
					Begin
						case opcion2 of
							'l': Begin
								Writeln('Escribe el número del libro de su elección');
								readln(eleccion);
								clrscr;
								prestamo[contadorprestamos].prestados := Biblioteca[eleccion].libros;
							end;
							't':Begin
								Writeln('Escribe el número del trabajo de su elección');
								readln(eleccion);
								clrscr;
								prestamo[contadorprestamos].prestados := Biblioteca[eleccion].trabajos;
							End
							else
							Begin
								writeln('Opción no existente');
								break;
							end;
						end;
					end;
					until (opcion2='t') or (opcion2='l');
					for m:= 0 to contadorprestamos-1 do
					if CompareStr(prestamo[contadorprestamos].prestados, prestamo[m].prestados) = 0 then
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
				until (not (CompareStr(prestamo[m].prestados, prestamo[contadorprestamos].prestados) = 0)) or (opcion = 'n');
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

procedure listactivos (var prestamo: array of sacados; contadorprestamos:integer);
var
f, num, activos: integer;

begin
    activos := 0; // Variable para llevar un seguimiento de los préstamos activos
    num := 4; // Variable para llevar un seguimiento del número de sanciones


    prestamo[2].name := 'Pancho';
    prestamo[2].lastname := 'J';
    prestamo[2].prestados := 'Don quijote';
    prestamo[2].ID := 32132121;
    prestamo[2].dias := 3;
    // Verificar y procesar préstamos activos
    if (length(prestamo) > 0) then
    begin
        for f := 0 to length(prestamo)-1 do
        begin
            // Solo procesar préstamos activos (no vacíos)
            if prestamo[f].name <> '' then
            begin
                if prestamo[f].dias = 0 then
                begin
                    num := num + 1;
                    sanciones[num].name := prestamo[f].name;
                    sanciones[num].lastname := prestamo[f].lastname;
                    sanciones[num].ID := prestamo[f].ID;
                    sanciones[num].prestado := prestamo[f].prestados;
                    sanciones[num].dias := 7;
                    writeln(sanciones[num].name, ' ', sanciones[num].lastname, ' Se le acabo el tiempo de prestamo, desde este momento esta sancinado');
                    prestamo[f].name := '';
                    prestamo[f].lastname := '';
                    prestamo[f].prestados := '';
                    prestamo[f].ID := 0;
                    activos := activos - 1; // Disminuir el número de préstamos activos
                    break;
                end
                else
                begin
                    Writeln('Nombre: ', prestamo[f].name, ' ', prestamo[f].lastname);
                    writeln('Prestamo: ', prestamo[f].prestados);
                    prestamo[f].dias := prestamo[f].dias - 0.01;
                    writeln('Tiempo restante: ', prestamo[f].dias:2:2);
                    delay(4000);
                    clrscr;
                end;
            end;
        end;
    end
    else
    begin
        Writeln('No hay ningun prestamo activo');
    end;
end;


procedure listsancion (sanciones:array of lista);
var
f, sancionados: integer;

begin
    sancionados := 0; // Variable para llevar un seguimiento de los préstamos activos

    sanciones[2].name := 'Pancho';
    sanciones[2].lastname := 'J';
    sanciones[2].prestado := 'Don quijote';
    sanciones[2].ID := 32132121;
    sanciones[2].dias := 3;
    // Verificar y procesar préstamos activos
    if (length(sanciones) > 0) then
    begin
        for f := 1 to length(sanciones)-1 do
        begin
            // Solo procesar préstamos activos (no vacíos)
            if sanciones[f].name <> '' then
            begin
                if sanciones[f].dias = 0 then
                begin
                    writeln(sanciones[f].name, ' ', sanciones[f].lastname, ' Se le acabo el tiempo de sanciones, desde este momento esta sancinado');
                    sanciones[f].name := '';
                    sanciones[f].lastname := '';
                    sanciones[f].prestado := '';
                    sanciones[f].ID := 0;
                    sancionados := sancionados - 1; // Disminuir el número de préstamos activos
                    break;
                end
                else
                begin
                    Writeln('Nombre: ', sanciones[f].name, ' ', sanciones[f].lastname);
                    writeln('sanciones: ', sanciones[f].prestado);
                    sanciones[f].dias := sanciones[f].dias - 0.01;
                    writeln('Tiempo restante: ', sanciones[f].dias:2:2);
                    delay(4000);
                    clrscr;
                end;
            end;
        end;
    end
    else
    begin
        Writeln('No hay ningun sanciones activo');
    end;
end;


procedure DiaSemana (var MinutoActual:integer; HoraActual:integer);
const
DiasSemana: array[1..5] of string = ('Lunes','Martes','Miercoles','Jueves','Viernes');
p:integer=0;


Begin
	if (HoraActual=8) and (MinutoActual=30) then
		begin
			p:=p+1;
			writeln(DiasSemana[p]);
		end
	else
		begin
			writeln(DiasSemana[p]);
		end;
end;

procedure AvanzarReloj();
begin
	Minutos := Minutos + 15;
	if Minutos >= 60 then
		begin
			Minutos := Minutos - 60;
			Horas := Horas + 1;
			if (Horas >= 16) and (Minutos >=30) then
			begin
				Horas := 8;
				Minutos:=15;
			end;
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
		if (Horas >= 16) and (Minutos >=30) then
			begin
				Horas := 8;
				Minutos:=15;
			end;
		AvanzarReloj;
	    HoraActual := Horas;
		MinutoActual := Minutos;
		DiaSemana(MinutoActual,HoraActual);
		writeln('Hora Actual: ', Horas, ':', Minutos);
		writeln('Escriba el número de la acción que quieres realizar');
		writeln();
		writeln('1. Registrarse');
		writeln('2. Sacar un libro');
		Writeln('3. Revisar los libros disponibles');
		Writeln('4. Ingresar un nuevo libros');
		writeln('5. Revisar prestamos activos');
		writeln('6. Revisar sanciones');
		writeln('0. Salir');
		writeln();
		readln(opcion);
		clrscr;
		case opcion of
			'1': begin
					regisalum;
				End;
			'2': begin
					registrablib(registros, prestamo,contadorprestamos);
				end;
			'3': Begin
					revislibtra (Biblioteca, prestamo);
				end;
			'4': Begin
					newbook(Biblioteca);
				end;
			'5': Begin
					listactivos(prestamo,contadorprestamos);
				end;
			'6': Begin
					listsancion(sanciones);
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
	until (opcion ='0');		
	
	
END.

