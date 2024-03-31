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
		writeln('Escriba su cédula de identidad');
		readln(registros[i].cedula);
		valCI:=true;
		if (registros[i].cedula<1000000) or (registros[i].cedula>100000000)then
		Begin
			valCI:=false;
			writeln('Cédula de identidad falsa o caracter no permitido, vuelva a introducir su cédula');
			delay(5000);
			clrscr;
		end
		else
		Begin
			writeln('Cédula de identidad aceptada');
			delay(2000);
			clrscr;
			Writeln('Ahora se esta haciendo una revisión de si ese cédula existe no tardaremos...');
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
		Writeln('Su ID siempre sera su número de cédula, si quiere pedir un préstamo de un libro o trabajo');
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
	
	Writeln('Tenemos los siguientes libros disponible');
	writeln('presione cualquier tecla para ver la lista de trabajos');
	writeln;
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
	readln();
	clrscr;
	Writeln('Tenemos los siguientes trabajos disponibles'); 
	writeln('Presione cualquier tecla para escoger su libro/trabajo');
	writeln;
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
	readln();
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

procedure prestalib (var registros:array of registro);
var
a,m,eleccion,posicion:integer;
ID:longint;
valID: boolean;
opcion,opcion2: char;
const
l:integer=0;


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
				writeln('ID o caracter no permitido, vuelva a introducir su cédula debe encontrase entre un millón  cien millones');
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
				Writeln('Bienvenido, aprete cualquier tecla para continuar');
				writeln('Nombre: ',registros[posicion].name);
				writeln('Apellido: ',registros[posicion].lastname);
				writeln('ID: ',registros[posicion].cedula);
				readln;
				clrscr;
				opcion:=' ';
				l:=l+1;
				repeat
				Begin
					prestamo[l].name := registros[posicion].name;
					prestamo[l].lastname:=registros[posicion].lastname;
					prestamo[l].ID:=registros[posicion].cedula;
					prestamo[l].dias:=3;
					revislibtra(Biblioteca, prestamo);
					writeln(prestamo[l].name);
					writeln('De lo mostrado, que quiere pedir prestado "l" para libros y "t" para trabajos');
					readln(opcion2);
					repeat
					Begin
						case opcion2 of
							'l': Begin
								Writeln('Escribe el número del libro de su elección');
								readln(eleccion);
								clrscr;
								prestamo[l].prestados := Biblioteca[eleccion].libros;
							end;
							't':Begin
								Writeln('Escribe el número del trabajo de su elección');
								readln(eleccion);
								clrscr;
								prestamo[l].prestados := Biblioteca[eleccion].trabajos;
							End
							else
							Begin
								writeln('Opción no existente');
							end;
						end;
					end;
					until (opcion2='t') or (opcion2='l');
					for m:= 0 to l do
					if CompareStr(prestamo[l].prestados, prestamo[m].prestados) = 0 then
					begin
						writeln('El libro ya está prestado.');
						writeln('¿Desea elegir otro libro? (s/n)');
						readln(opcion);
						clrscr;
					end
					else
					begin
						writeln('Préstamo aprobado, tiene hasta tres días para devolverlo sino será sancionado');
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
			Writeln('ID no existente, vuelva a intentarlo y si no vaya a la opcion de registro y registrese');
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
procedure renovacion ();
var
a,posicion:integer;
ID:longint;
valID, renovar: boolean;
opcion: char;


BEGIN
	renovar:=false;
	if (length(prestamo)> 0) then
	Begin
		repeat
		Begin
			writeln('Escriba su ID');
			readln(ID);
			valID:=true;
			if (ID<1000000) or (ID>100000000)then
			Begin
				valID:=false;
				writeln('ID o caracter no permitido, vuelva a introducir su cédula debe encontrase entre un millón  cien millones');
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
		for a:= 0 to length(prestamo)-1 do
		begin
			if (prestamo[a].ID=ID) then
			begin
				renovar:= true;
				writeln('Bienvenido');
				posicion:=a;
				clrscr;
				writeln('Prestador: ', prestamo[posicion].name,' ',prestamo[posicion].lastname);
				writeln('Libro/Trabajo prestado: ', prestamo[posicion].prestados);
				writeln('Tiempo que le queda hasta su vencimiento: ', prestamo[posicion].dias:2:2);
				writeln();
				repeat
				writeln('Desea hacer una renovación de su préstamo?');
				writeln('S para Si y N para No');
				readln(opcion);
				clrscr;
				if (opcion='S') or (opcion='s') then
					begin
						Writeln('Renovación realizada');
						prestamo[posicion].dias:=3;
						writeln('Prestador: ', prestamo[posicion].name,' ',prestamo[posicion].name);
						writeln('Libro/Trabajo prestado: ', prestamo[posicion].prestados);
						writeln('Tiempo que le queda hasta su vencimiento: ', prestamo[posicion].dias:2:2);
						writeln('Presione cualquier tecla para continuar');
						readln;
						clrscr;
					end
				else
					begin
						writeln('Cancelando renovación');
						writeln('Presione cualquier tecla para continuar');
						readln;
						clrscr;
					end;
				until (opcion='S') or (opcion='s') or (opcion='n') or (opcion='n');
			end;
		end;
	end;
	if not renovar then
		Begin
			writeln('No hay nadie a quien renovar');
		end;
end;

procedure listactivos (var prestamo: array of sacados);
var
f, num: integer;
activos: boolean;

begin
    activos := false; // Variable para llevar un seguimiento de los préstamos activos
    num := 4; // Variable para llevar un seguimiento del número de sanciones

    // Verificar y procesar préstamos activos
    if (length(prestamo) > 0) then
   
    begin
    
        for f := 0 to length(prestamo)-1 do
        
        begin
            // Solo procesar préstamos activos (no vacíos)
            if prestamo[f].name <> '' then
            begin
				activos:=true;
                if prestamo[f].dias = 0 then
                begin
                    num := num + 1;
                    sanciones[num].name := prestamo[f].name;
                    sanciones[num].lastname := prestamo[f].lastname;
                    sanciones[num].ID := prestamo[f].ID;
                    sanciones[num].prestado := prestamo[f].prestados;
                    sanciones[num].dias := 7;
                    writeln(sanciones[num].name, ' ', sanciones[num].lastname, ' Se le acabo el tiempo de préstamo, desde este momento esta sancinado');
                    prestamo[f].name := '';
                    prestamo[f].lastname := '';
                    prestamo[f].prestados := '';
                    prestamo[f].ID := 0;
                    break;
                end
                else
                begin
                    Writeln('Nombre: ', prestamo[f].name, ' ', prestamo[f].lastname);
                    writeln('Préstamo: ', prestamo[f].prestados);
                    prestamo[f].dias := prestamo[f].dias - 0.09;
                    writeln('Tiempo restante: ', prestamo[f].dias:2:2);
                    readln();
                    clrscr;
                end;
            end;
        end;
    end;
    if not activos then
    begin
        Writeln('No hay ningun préstamo activo');
    end;
end;

procedure devoluciones;
var
  i, pos: integer;
  ID: longint;
  valID, activos: boolean;


begin
  activos := false;
  
  repeat
    begin
      writeln('Escriba su ID');
      readln(ID);
      valID := true;
      if (ID < 1000000) or (ID > 100000000) then
      begin
        valID := false;
        writeln('ID o caracter no permitido, vuelva a introducir su cédula debe encontrase entre un millón  cien millones');
        delay(5000);
        clrscr;
      end
      else
      begin
        writeln('ID aceptada');
        delay(2000);
        clrscr;
      end;
    end;
  until valID;
  
  // Verificar si hay préstamos activos para la devolución
  for i := 1 to Length(prestamo) do
  begin
    if prestamo[i].ID = ID then
    begin
      pos := i;
      writeln('Bienvenido ');
      writeln('Prestador: ', prestamo[pos].name, ' ', prestamo[pos].lastname);
      writeln('Libro/Trabajo prestado: ', prestamo[pos].prestados);
      writeln('Se esta realizando la devolución...');
      prestamo[pos].name := '';
      prestamo[pos].lastname := '';
      prestamo[pos].prestados := '';
      prestamo[pos].dias := 0;
      prestamo[pos].ID := 0;
      activos := true;
      break; // Se encontró un préstamo, detener la búsqueda
    end;
  end;
  
  // Verificar si hay sanciones activas para la devolución
  if not activos then
  begin
    for i := 1 to Length(sanciones) do
    begin
      if sanciones[i].ID = ID then
      begin
        pos := i;
        writeln('Bienvenido ');
        writeln('Sancionado: ', sanciones[pos].name, ' ', sanciones[pos].lastname);
        writeln('Libro/Trabjo sancionado: ', sanciones[pos].prestado);
        writeln('Se esta realizando la devolución...');
        sanciones[pos].prestado := '';
        activos := true;
        break; // Se encontró una sanción, detener la búsqueda
      end;
    end;
  end;
  
  if not activos then
    writeln('No hay préstamos ni sanciones para realizar una devolución');
    delay(4000);
    clrscr;
end;


procedure listsancion ();
var
f: integer;
sancionados: boolean;

begin
    sancionados := false; // Variable para llevar un seguimiento de las sanciones activos

    // Verificar y procesar sanciones activos
    if (length(sanciones) > 0) then
    begin
        for f := 1 to length(sanciones)-1 do
        begin
            // Solo procesar sanciones activos (no vacíos)
            if sanciones[f].name <> '' then
            begin
				sancionados:=true;
                if sanciones[f].dias = 0 then
                begin
                    writeln(sanciones[f].name, ' ', sanciones[f].lastname, ' Se le acabo el tiempo de sanciones, desde este momento esta sancinado');
                    sanciones[f].name := '';
                    sanciones[f].lastname := '';
                    sanciones[f].prestado := '';
                    sanciones[f].ID := 0;
                    // Disminuir el número de préstamos activos
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
    end;
    if not sancionados then
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
		writeln('5. Revisar préstamos activos');
		writeln('6. Revisar sanciones');
		writeln('7. Realizar renovación');
		writeln('8. Realizar devolución');
		writeln('0. Salir');
		writeln();
		readln(opcion);
		clrscr;
		case opcion of
			'1': begin
					regisalum;
				End;
			'2': begin
					prestalib(registros);
				end;
			'3': Begin
					revislibtra (Biblioteca, prestamo);
				end;
			'4': Begin
					newbook(Biblioteca);
				end;
			'5': Begin
					listactivos(prestamo);
				end;
			'6': Begin
					listsancion();
				end;
			'7': begin
					renovacion();
				end;
			'8': begin
					devoluciones();
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

