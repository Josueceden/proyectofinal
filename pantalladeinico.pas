program untitled;

uses crt;
var 
opcion: char;

BEGIN
	repeat
	begin
		Writeln('¿En que se le puede ayudar hoy?');
		writeln('Presione los siguientes numeros para realizar la accion deseada');
		writeln('1. Registro de alumno');
		writeln('2. Registro de prestamo de libro o trabajo');
		Writeln('3. Revisar prestamos activos');
		Writeln('4. Revisar los libros o trabajos disponibles');
		writeln('5. registrar o revisar los alumnos sancionados');
		Writeln('6. Realizar una renovacion');
		Writeln('7. Realizar una devolucion');
		Writeln('8. Realizar la entrada de un nuevo libro o trabajo');
		Writeln('9. Realizar una modificacion o eliminacion en el registro');
		Writeln('0. Terminar sesion');
		readln(opcion);
		case opcion of
			'1': begin
					regisalum;
				End;
			'2': begin
					registrablib;
				End;
			'3': Begin
					revpres;
				End;
			'4':Begin
					revislibtra;
				End;
			'5':Begin
					regisrevisan;
				End;
			'6':Begin
					rearen;
				End;
			'7':Begin
					readev;
				End;
			'8':Begin
					newbook;
				End;
			'9':Begin
					modeli;
				end;	
			'0':Begin
					writeln('Que tenga feliz dia/tarde/noche');
				end;	
				else
				Begin
					Writeln('No existe esa opion vuelve a intertarlo');
					delay(2000) 
				End;
			end;
		end;
		until opcion='0'
END.
