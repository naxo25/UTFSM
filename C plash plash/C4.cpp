#include <stdio.h>
#include <stdlib.h>

int calcular(int &N1, int &N2);
void escribir(int Numero);

int main(){
	int N1, N2;
	system("cls");
	printf("ingrese un numero: ");
	scanf("%d",&N1);
	printf("ingrese otro numero: ");
	scanf("%d",&N2);
	escribir(calcular(N1,N2));
	system("Pause");
}

int calcular(int &N1, int &N2){
	return N1 * N2;
}

void escribir(int Numero){
	int N1 = Numero;
	while(N1 < 12) printf("El resultado es %d",++N1);
}
