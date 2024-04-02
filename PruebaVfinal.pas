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
txtFile:text;
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
			Writeln('Ahora se esta haciendo una revisión de si es cédula existe no tardaremos...');
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
	Assign(txtFile, 'registros.txt');
	if FileExists('registros.txt') then
	Append(txtFile)
	else
	Rewrite(txtFile);

	if (registros[i].name <> '') then
	begin
	  writeln(txtFile, 'Nombre:', registros[i].name);
	  writeln(txtFile, 'Apellido:', registros[i].lastname);
	  writeln(txtFile, 'Cedula:', registros[i].cedula);
	  writeln(txtFile, '-----------------------------------');

	end;	
	
	Close(txtFile);
	
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
	writeln('Presione cualquier tecla para ver la lista de trabajos');
	writeln;
	for i := 0 to length(Biblioteca)-1 do
		begin
			
			if (Biblioteca[i].libros= '') then
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
	for i := 0 to length(Biblioteca)-1 do
		begin
			if (Biblioteca[i].trabajos= '') then
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


procedure prestalib (var registros:array of registro; sanciones: array of lista);
var
a,m,eleccion,posicion:integer;

ID:longint;
valID: boolean;
opcion,opcion2: char;

const
b:integer=0;


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
					Writeln('Bienvenido, presione cualquier tecla para continuar');
					writeln('Nombre: ',registros[posicion].name);
					writeln('Apellido: ',registros[posicion].lastname);
					writeln('ID: ',registros[posicion].cedula);
					readln;
					clrscr;
					revislibtra(Biblioteca, prestamo);
					b:=b+1;
					repeat
						Begin

							writeln('De lo mostrado, que quiere pedir prestado "L" para libros y "T" para trabajos');
							readln(opcion2);
							case opcion2 of
								'L': Begin
									Repeat
										Begin
											eleccion:=0;
											opcion:=' ';
											Writeln('Escribe el número del libro de su elección');
											readln(eleccion);
											clrscr;
											if Biblioteca[eleccion+1].libros ='' then
												Begin
													writeln('Libro no existente');
												end
											else
												Begin
													for m:= 0 to b-1 do
													if prestamo[m].prestados = Biblioteca[eleccion+1].libros then
														begin
															writeln('El libro ya está prestado.');
															writeln('¿Desea elegir otro libro? (s/n)');
															readln(opcion);
															clrscr;
														end
													else
														begin
															Writeln('Espere...');
															delay(1000);
															clrscr;
														end;
												end;
										end;
										until (not(Biblioteca[eleccion+1].libros ='')and not(opcion='s')) or (opcion='n') ;
								end;
								'T':Begin
									Repeat
										Begin
											eleccion:=0;
											opcion:=' ';
											Writeln('Escribe el número del trabajo de su elección');
											readln(eleccion);
											clrscr;
											if Biblioteca[eleccion+1].trabajos ='' then
												Begin
													writeln('Trabajo no existente');
												end
											else
												Begin
													for m:= 0 to b-1 do
													if prestamo[m].prestados = Biblioteca[eleccion+1].trabajos then
														begin
															writeln('El trabajo ya está prestado.');
															writeln('¿Desea elegir otro trabajo? (s/n)');
															readln(opcion);
															clrscr;
														end
													else
														begin
															Writeln('Espere...');
															delay(1000);
															clrscr;
														end;
												end;
										end;
									until (not(Biblioteca[eleccion+1].trabajos ='')and not(opcion='s')) or (opcion='n') ;
									End
								else
								Begin
									writeln('Opción no existente');
								end;
							end;		
						end;
					until (opcion2='T') or (opcion2 = 'L');
					if opcion='n' then
						Begin
					
						end
					else
						Begin
							if opcion2='L'then
								Begin
									prestamo[b].name := registros[posicion].name;
									prestamo[b].lastname:=registros[posicion].lastname;
									prestamo[b].ID:=registros[posicion].cedula;
									prestamo[b].dias:=3;
									prestamo[b].prestados := Biblioteca[eleccion+1].libros;
									writeln('Préstamo aprobado, tiene hasta tres días para devolverlo sino será sancionado');
									delay(5000);
									clrscr;
								end
							else
								Begin
									prestamo[b].name := registros[posicion].name;
									prestamo[b].lastname:=registros[posicion].lastname;
									prestamo[b].ID:=registros[posicion].cedula;
									prestamo[b].dias:=3;
									prestamo[b].prestados := Biblioteca[eleccion+1].trabajos;
									writeln('Préstamo aprobado, tiene hasta tres días para devolverlo sino será sancionado');
									delay(5000);
									clrscr;
								end;
						end;
					Break;
				end
			else
				Begin
					Writeln('Espere...');
					delay(200);
					clrscr;
				end;
			end;
		if (registros[a].cedula<>ID) then
			Begin
				Writeln('ID no existente , vuelva a intentarlo, si no vaya a la opción de registro y registrese');
				delay(5000);
				clrscr;
			end
		else
			Begin
				writeln();
			end;
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
				until (opcion='S') or (opcion='s') or (opcion='n') or (opcion='N');
			end;
		end;
	end;
	if not renovar then
		Begin
			writeln('No hay nadie a quien renovar');
			delay(2000);
			clrscr;
		end;
end;

procedure actualizarPrestamos();
var
f,num: integer;

begin
	num:=0;
    // Verificar y procesar préstamos activos
    if (length(prestamo) > 0) then
    begin
        for f := 0 to length(prestamo)-1 do
        begin
            // Solo procesar préstamos activos (no vacíos)
            if prestamo[f].name <> '' then
            begin
                prestamo[f].dias := prestamo[f].dias - 0.03;
                // Si los días restantes son menores o iguales a cero, se debe aplicar la sanción
                if prestamo[f].dias <= 0.00 then
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
                    prestamo[f].dias := -1;
                end;
            end;
        end;
    end;
end;

procedure listactivos ();
var
    f,a: integer;
    activos: boolean;
    Prestados: text;
begin
    activos := false; // Variable para llevar un seguimiento de los préstamos activos
   
    // Actualizar préstamos activos antes de listarlos
    actualizarPrestamos();

    // Verificar y procesar préstamos activos
    if (length(prestamo) > 0) then
    begin
        for f := 0 to length(prestamo)-1 do
        begin
            // Solo procesar préstamos activos (no vacíos)
            if prestamo[f].name <> '' then
            begin
                activos := true;
                Writeln('Nombre: ', prestamo[f].name, ' ', prestamo[f].lastname);
                writeln('Préstamo: ', prestamo[f].prestados);
                writeln('Tiempo restante: ', prestamo[f].dias:2:2);
                readln();
                clrscr;
                Assign(Prestados, 'Prestamos.txt');
				  if FileExists('Prestamos.txt') then
					Append(Prestados)
				  else
					Rewrite(Prestados);
					for a:= 0 to length(prestamo)-1 do
					begin
						if (prestamo[a].name <> '') then
							begin
							 Writeln(Prestados,'Nombre: ', prestamo[a].name, ' ', prestamo[f].lastname);
							 writeln(Prestados,'Préstamo: ', prestamo[a].prestados);
							 writeln(Prestados,'Tiempo restante: ', prestamo[a].dias:2:2);
							  writeln(Prestados, '-----------------------------------');

						  end;
					end;
				Close(Prestados);
            end;
        end;
    end;

    if not activos then
    begin
        Writeln('No hay ningún préstamo activo');
        delay(2000);
        clrscr;
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
      prestamo[pos].dias := -1;
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

procedure actualizarSanciones();
var
f,num: integer;

begin
	num:=0;
    // Verificar y procesar préstamos activos
    if (length(sanciones) > 0) then
    begin
        for f := 0 to length(sanciones)-1 do
        begin
            // Solo procesar préstamos activos (no vacíos)
            if sanciones[f].name <> '' then
            begin
                sanciones[f].dias := sanciones[f].dias - 0.03;
                // Si los días restantes son menores o iguales a cero, se debe aplicar la sanción
                if sanciones[f].dias <= 0.00 then
                begin
                    writeln(sanciones[num].name, ' ', sanciones[num].lastname, ' Se le acabo el tiempo de préstamo, desde este momento esta sancinado');
                    sanciones[f].name := '';
                    sanciones[f].lastname := '';
                    sanciones[f].ID := 0;
                    sanciones[f].dias := -1;
                end;
            end;
        end;
    end;
end;


procedure listsancion ();
var
f,a: integer;
sancionados: boolean;
penalizados:text;

begin
    sancionados := false; // Variable para llevar un seguimiento de las sanciones activos

    actualizarSanciones;
    if (length(sanciones) > 0) then
    begin
        for f := 1 to length(sanciones)-1 do
        begin
            // Solo procesar sanciones activos (no vacíos)
            if sanciones[f].name <> '' then
            begin
				sancionados:=true;
                    Writeln('Nombre: ', sanciones[f].name, ' ', sanciones[f].lastname);
                    writeln('Préstamo del sancionado: ', sanciones[f].prestado);
                    writeln('Tiempo restante: ', sanciones[f].dias:2:2);
                    readln();
                    clrscr;
                    Assign(penalizados, 'penalizados.txt');
				  if FileExists('penalizados.txt') then
					Append(penalizados)
				  else
					Rewrite(penalizados);
					
					for a := 1 to length(sanciones)-1 do
					begin
						if (sanciones[a].name <> '') then
							begin
							 Writeln(penalizados, 'Nombre: ', sanciones[a].name, ' ', prestamo[f].lastname);
							 writeln(penalizados,'Préstamo: ', sanciones[a].prestado);
							 writeln(penalizados, 'Tiempo restante: ', sanciones[a].dias:2:2);
							  writeln(penalizados, '-----------------------------------');

						  end;
					end;
				Close(penalizados);
            end;
        end;
    end;
    if not sancionados then
    begin
        Writeln('No hay sanciones activas');
        delay(2000);
        clrscr;
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
		actualizarPrestamos;
		actualizarSanciones;
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
					prestalib(registros,sanciones);
				end;
			'3': Begin
					revislibtra (Biblioteca, prestamo);
				end;
			'4': Begin
					newbook(Biblioteca);
				end;
			'5': Begin
					listactivos();
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

