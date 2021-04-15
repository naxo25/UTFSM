
#include <stdio.h>
#include <string.h>
int main()
{
char rut[10],ruta[12],rutaux[7];
int total=0;
int a,b,c,i,j,aux,cont = 3,acum = 0,resto = 0,digito = 0;
printf("CALCULO DEL DIGITO VERIFICADOR RUT");
printf("\n\n");
printf("Ingrese el rut sin dijito verificador: ");
gets(rut);
total=strlen(rut);
j=0;
aux = rut[total-1]-48;
for(i=0;i<total;i++){
    if(rut[i] == '.' || rut[i] == '-'){

        continue;
         }
    rutaux[j] = rut[i];
    j++;
}
for(i=0;i<8;i++){
    rut[i]=rutaux[i];
}
total=8;
if(total<=7) {
for(a=0;a<=7;a++) {
if(rut[0]==rut[a]) {
ruta[0]='0';
ruta[a+1]=rut[0];
}
else {
ruta[a+1]=rut[a];
}
}
}
else
{

for(b=0;b<=total;b++) {
ruta[b]=rut[b];
}
}

for(c=0;c<=7;c++) {
if(cont==2) {
acum=acum+((ruta[c]-48)*cont);

cont=8;

}
else
{
acum=acum+((ruta[c]-48)*cont);
}
cont=cont-1;
}
digito=(11-(acum%11));
if(aux == digito){
    printf("\n\nRUT CORRECTO, SU DIGITO VERIFICADOR ES: %d",aux);
}
else{
    printf("\n\nRUT INCORRECTO. EL DIGITO VERIFICADOR ES: %d",digito);
}
getchar();
getchar();
}
