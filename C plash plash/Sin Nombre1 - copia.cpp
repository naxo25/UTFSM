#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <windows.h>
#include <string.h>
#include <iostream>
#include <conio.h>
using namespace std;
#define tope 20

void corrimiento(int ar[], int pos, int max, int num);
void agregar(int numero[], int &max);
int buscar(int numero[], int num, int &max);
void quitar(int numero[]);
void desplegar(int numero[]);

int main(){
	int numero[tope], i =-1, max = 0, pos =-1;
	
	for(int c=0; c<tope; c++)
		numero[c] = 0;	

	while (i != 0){
	printf("1 - Agregar");
 	printf("2 - Eliminar");
 	printf("3 - Desplegar");
 	printf("Escriba el numero (0 para salir) ");
	cin >> i;
		if (i == 1) {
		   agregar(numero,max);
  	    }
		if (i == 2) {
		   quitar(numero);
  	    }
		if (i == 3) desplegar(numero);
	}
}

void agregar(int ar[], int &max){
    int numerito, pos;
	printf("ingrese numero");
	cin >> numerito;
	
	pos = buscar(ar,numerito,max);
	cout << pos << " es la posicion" << endl;
	if (pos == -1){
	   printf("numero repetido");
	}else{
		if (pos == -3){
			ar[max-1] = numerito;
		}else{
			if(pos > 0){
				corrimiento(ar,pos,max,numerito);
			}else{
				if(pos == -2){
					corrimiento(ar,pos,max,numerito);
				}else{
					  if(pos == 0){
					  	 ar[0] = numerito;
	  	 			 }
				}
			}
	    }
	}
}

void desplegar(int ar[]){
	for(int i=0; i<tope ;i++)
		cout << ar[i] << endl;	
}

void corrimiento(int ar[], int pos, int max, int num){
	int araux[20]; int w;
	if(pos == -2){
		w = 0;
	}else{
		w = pos;
	}
	
	for(int c=w; c<max; c++){
	    araux[c] = ar[c];
	}
 	
	ar[w] = num;
	for(int c=w; c<max; c++){
   	    ar[c+1] = araux[c];
 	}
	
	
}

int buscar(int ar[], int num, int &max){
	if (ar[0] == 0){
		max++;
		return 0;
	}else{
		if(num > ar[max -1]){ //1
			max++;
			return -3;
		}else{
			for(int c=0; c<max; c++){
				if(num < ar[0]){
					max++;   
					return -2;
				}
				if(num < ar[c] && num > ar[c-1]){
					max++;   
					return c;
				}
				if(ar[c] == num)
					return -1; 
			}
		}
	}
}
	
void quitar(int ar[]){
}
