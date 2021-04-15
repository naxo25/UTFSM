#include <iostream>
#include <stdlib.h>
using namespace std;

int main(){
    char Rut[12], rutsito[12] = "";
    int c=0, j=0, i=0,T, contador=0, caso = 0;
    system("cls");
    cout << ("Ingrese Rut: ");
    cin.getline(Rut,12);
       
    for (j=0; j<13; j++){
       if ((Rut[j] >= '0' && Rut[j] <= '9')||(Rut[j] == 'k'||Rut[j] == 'K' && Rut[j+1]=='\o')){
           rutsito[j-c] = Rut[j];
           contador = contador + 1;}
           else{
		    c = c + 1;}
       cout << rutsito<< endl;
    }
   
   if (((contador == 9) &&(caso == 3|| caso == 1||caso == 4)) || ( (contador == 8) &&(caso == 2|| caso == 3||caso == 4))){
    if (Rut[11] == 'k'||Rut[11] == 'k'||Rut[11] >= '0'||Rut[11] <= '9'){
       rutsito[11] = Rut[11];
       rutsito[12] = '\0';}
       else{
            if (Rut[10] == 'k'||Rut[10] == 'k'||Rut[10] >= '0'||Rut[10] <= '9'){
                rutsito[10] = Rut[10];
                rutsito[11] = '\0';}   
    }                                 
   }else {caso = 0;
   }  
   
   if (atoi(Rut) == Rut[12]);{
   	  caso = 2;}
   	  
    cout << contador << endl;
    cout << caso << endl;          
	cout << T << endl;        
               
    if (caso == 0 && contador >= 8){
      cout << "Rut no valido" << endl;} 
        else{ cout << rutsito << endl;}
  
    system("pause");
}
