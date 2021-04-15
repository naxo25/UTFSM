#include <stdlib.h>
#include <iostream>
#include <string.h>
using namespace std;

int main(){
	int M[][3] = {15,20,30,45,50,65,70,88,90};
 	for (int i = 0; i < 3; i++){
 		for (int c = 0; c < 3; c++){
			 printf("%d ",M[i][c]);
		 }
		 cout << endl;
	}
	int vector[5], punt;
	for(punt = 0; punt < 5; punt++){
		printf("Ingrese numero para el vector %d: ", punt);
		scanf("%d", &vector[punt]);
	}
	for(punt = 0; punt < 5; punt++){
		printf("El numero del vector[%d] es %d\n", punt, vector[punt]);
	}
	char palabra[7], palabra2[10];
	cout << "Ingrese la wea : ";
	cin.getline(palabra,50);
	cout << palabra << "  " << strlen(palabra) << endl;
	strcpy(palabra2,palabra);
	cout << "2 " << palabra2 << endl;
	cout << "1 " << palabra << endl;
	cout << "2 " << palabra2 << endl;
}
