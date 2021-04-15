#include <iostream>
#include <stdlib.h>
#include <string.h>

using namespace std;

int main(){
    char Rut[13], rutsito[13] = "", RutValidar[13]="", a[8], DigVer;
    
    int c=0, j=0, i=0, contador=0, caso = 0, PosGuion;
    system("cls");
    cout << ("Ingrese Rut: ");
    cin.getline(Rut,13);
    
	
    
	    
    if (Rut[2]=='.' && Rut[6]=='.' && Rut[10]=='-'){
       caso = 1;     
    }else{
          if (Rut[1]=='.' && Rut[5]=='.' && Rut[9]=='-'){
             caso = 2;
          }else{
                if (Rut[7]=='-'||Rut[8]=='-'){
                   caso = 3;                               
                }
          }
    }
    
    /*DigVer= strrchr(Rut, '-');
    cout << (DigVer[2]) << endl;
    
    if (DigVer[2]!=""){
    	cout << ("jajajaja")
	}*/
    
    if ((caso == 1) || (caso == 2) || (caso == 3)){     
       for(j=0;j<13;j++){
          if ((Rut[j] >= '0' && Rut[j] <= '9')){
             rutsito[j-c] = Rut[j];
             contador = contador + 1;
		  }else c = c + 1;
      }
    }
    
    if (Rut[11] == 'k'||Rut[11] == 'k'){
       rutsito[11]=Rut[11];}
       else{
            if (Rut[10] == 'k'||Rut[10] == 'k'){
                rutsito[11]=Rut[11];}                                    
    } 
               
    rutsito[13] = '\0';   
	
	       
               
    if (caso == 0){
      cout << "Rut no valido" << endl;} 
        else{ cout << rutsito << endl;}
        
	//Salvar el Digito Verificador
	if (Rut[11]>='0' && Rut[11]<='9'){
		DigVer=Rut[11];
	}else{
		if (Rut[10]>='0' && Rut[10]<='9'){
			DigVer=Rut[10];
		}else{
			if (Rut[9]>='0' && Rut[9]<='9'){
				DigVer=Rut[9];
			}
			else{
				if (Rut[8]>='0' && Rut[8]<='9'){
					DigVer=Rut[8];
				}
			}
		}
	}
    
    //Limpiar cadena
    for (i=0; i<14; i++){
    	RutValidar[i]='\0';
    }
    
    for (i=0; i<strlen(rutsito)-1; i++){
    	RutValidar[i]=rutsito[i];
    }
   cout << RutValidar << endl;

    int x,resto,RutSuma,DVerificado;

    x=2;
    RutSuma=0;
    for (i=0; i<=strlen(RutValidar)-1; i++){
    	a[i] = RutValidar[i];
    	RutSuma=(RutSuma + (atoi(a)*x));
    	cout<<(atoi(a))<<" + "<<x<<"="<<RutSuma<<endl;
    	x++;
    	if (x==8){
    		x=2;}
    }
    cout<<RutSuma<< "     pico    " << a  << endl;
   	resto = RutSuma%11;
   	DVerificado = 11-resto;
   	
   	cout << DVerificado << endl;
  
    system("pause");
}
