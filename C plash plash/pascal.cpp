#include <stdio.h>
#include <iostream>
using namespace std;

#define begin {
#define end }
#define Begin int main(){
#define procedure void
#define function int
#define writeln printf
#define readln cin >>
#define var 

class proce 
begin
    public:
		procedure obtener(int valor, int valor2);
	  	function multiplicar();
	private:
		var int N1, N2;		
end ;

procedure proce::obtener(int valor, int valor2)
begin
	 N1 = valor;
	 N2 = valor2;
end

function proce::multiplicar() 
begin
	 return N1 * N2;
end

Begin
	 var int a,b;
	 proce aca;
	 writeln("Numero 1: ");
	 readln a;
	 writeln("Numero 2: ");
	 readln b;
	 aca.obtener(a,b);
	 writeln("El resultado es %d",aca.multiplicar());
end	
