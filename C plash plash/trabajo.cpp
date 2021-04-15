#include <stdio.h>
#include <stdlib.h>
int main(){
    int Num1;
    int Num2;
    int Intentos;
    while (Num1 <= 102 || Num1 > 198){
                system("cls");
                printf("Ingrese un Numero: ");
                scanf("%d", &Num1);
    }
    
    Intentos = 10;
    while (Intentos > 0){
          Num2 = 0;
          while (Num2 < 102 || Num2 > 198){
                printf("Ingrese su Numero (Le quedan %d intentos): ", Intentos);
                scanf("%d", &Num2);
                }
          if(Num1 == Num2){
                 printf("Usted ha ganado");
                 break;
                 }
          else{
                 Intentos--;
                 }
          }
    printf("\n");
    system("pause");
    return 0;   
}
