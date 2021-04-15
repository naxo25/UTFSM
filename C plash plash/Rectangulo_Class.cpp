#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <windows.h>

using namespace std;

 void gotoxy(int x,int y){  
      HANDLE hcon;  
      hcon = GetStdHandle(STD_OUTPUT_HANDLE);  
      COORD dwPos;  
      dwPos.X = x;  
      dwPos.Y= y;  
      SetConsoleCursorPosition(hcon,dwPos);  
 } 

class Rectangulo{
	public:
		int Area();
		int Perimetro();
		void SetAlto(int Valor);
		void SetAncho(int Valor);
		void SetFila(int Valor);
		void SetCol(int Valor);
		int GetAlto();
		int GetAncho();
		int GetFila();
		int GetCol();
		void Dibujar(int Alto, int Ancho, int Fila, int Col);
	private:
		int Alto, Ancho, Fila, Columna;
		
};

int Rectangulo::Area(){
	return Alto * Ancho;
}

int Rectangulo::Perimetro(){
	return Alto*2 + Ancho*2;
}

void Rectangulo::SetAlto(int Valor){
	if (Valor < 0){
		Alto= 0;
	}else{
		Alto= Valor;
	}
}

void Rectangulo::SetAncho(int Valor){
	if (Valor < 0){
		Ancho= 0;
	}else{
		Ancho= Valor;
	}
}

void Rectangulo::SetFila(int Valor){
	if (Valor>25){
		Fila=25;
	}else{
		Fila=Valor;
	}
}

void Rectangulo::SetCol(int Valor){
	if (Valor>79){
		Columna=79;
	}else{
		Columna=Valor;
	}
}

int Rectangulo::GetAlto(){
	return Alto;
}

int Rectangulo::GetAncho(){
	return Ancho;
}

int Rectangulo::GetFila(){
	return Fila;
}

int Rectangulo::GetCol(){
	return Columna;
}

void Rectangulo::Dibujar(int Alto, int Ancho, int Fila, int Col){
	int i,j,k;
	
	system("cls");
	printf("Alto: %d Ancho: %d",Alto,Ancho);
	gotoxy(Col,Fila);
	for (i=0; i<Ancho; i++){
		printf("*");
		j=i+1;
	}

	for (i=Fila; i<Alto+Fila; i++){
		gotoxy(Col+j-1,i);
		printf("*");
		k=i+1;
	}
	k-=Fila;
	for (i=Ancho+Col; i>Col; i--){
		gotoxy(i-1,Fila+k-1);
		printf("*");
		
	}
	for (i=Fila+Alto; i>Fila; i--){
		gotoxy(Col,i-1);
		printf("*");
	}
	gotoxy(79,25);
	printf(".l.");
}

int main(){
	Rectangulo Forma;
	int Alto, Ancho, Fila, Col;
	system("cls");
	//...........................Area y Perimetro.............................................
	printf("Ingrese Alto: ");
	cin >> Alto;
	Forma.SetAlto(Alto);
	printf("Ingrese Ancho: ");
	cin >> Ancho;
	Forma.SetAncho(Ancho);
	printf("Area: %d \n", Forma.Area());
	printf("Perimetro: %d \n", Forma.Perimetro());
	//........................................................................................
	//........................................................................................
	printf("Ingrese Fila: ");
	cin >> Fila;
	Forma.SetFila(Fila);
	printf("Ingrese Columna: ");
	cin >> Col; 
	Forma.SetCol(Col);
	
	Forma.Dibujar(Alto,Ancho,Fila,Col);
	getchar();
}
