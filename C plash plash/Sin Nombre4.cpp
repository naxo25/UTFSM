#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <windows.h>
#include <string.h>
#include <iostream>
#include <conio.h>
using namespace std;
#define tope 20

void corrimiento(int ar[], int pos, int max, int num, int op);
void agregar(int numero[], int &max);
int buscar(int numero[], int num, int &max, int op);
void quitar(int numero[], int &max);
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
		   quitar(numero,max);
  	    }
		if (i == 3) {
		   if(max == 0){
		      printf("Arreglo vacio");
			  }else{
		   	  		desplegar(numero);
		   }
	  	}
	cout << endl;
	system("pause");
	system("cls");
	}
}

void agregar(int ar[], int &max){
    int numerito, pos, op =1;
	printf("ingrese numero: ");
	cin >> numerito;
	
	pos = buscar(ar,numerito,max,op);
	if (pos == -1){
	   printf("numero repetido");
	}else{
		if (pos == -3){
			ar[max-1] = numerito;
		}else{
			if(pos > 0){
				corrimiento(ar,pos,max,numerito,op);
			}else{
				if(pos == -2){
					corrimiento(ar,pos,max,numerito,op);
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
	for(int i=0; i<tope ;i++){
	    if(ar[i] != 0)
		cout << ar[i] << endl;	
	}
}

void corrimiento(int ar[], int pos, int max, int num, int op){
	int araux[20]; int w;
  if(op==1){
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
  if(op==2){
  	w = pos;
  	for(int c=w; c<max; c++){
  		 araux[c] = ar[c+1];  
	}
	
	for(int c=w; c<max; c++){
 	 	ar[c] = araux[c];
 	}
  }
}

int buscar(int ar[], int num, int &max, int op){
if(op==1){
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
}else{
if(op ==2){
    for(int c=0; c<max; c++){
		if(ar[c] == num)
	 	   return c;    
      }
    return -1;  
	}
  }
}
	
void quitar(int ar[], int &max){
	int pos, numerito, op = 2;
	if(max == 0){
		printf("Arreglo vacio");
	}else{
		  printf("ingrese numero: ");
		  cin >> numerito;
	pos = buscar(ar,numerito,max,op);
	if(pos == -1){
		printf("numero inexistente");
	}else{
		  printf("Numero eliminado");
		  corrimiento(ar,pos,max,numerito,op);
		  max--;
	}
}
}
