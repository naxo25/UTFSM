#include <stdio.h>
#include <string.h>
int main()
{
//declaracion de variables
char rut[7];
char rutvalidado[7];
int total=0;
int a,b,c;
int contador=3;
int acumulador=0;
int resto=0;
int digito=0;
//fin declaracion de variables
printf("*** CALCULO DEL DIGITO VERIFICADOR RUT (CHILE) ***");
printf("\n\n");
printf("Ingrese el rut que ejecutar: ");
gets(rut);
total=strlen(rut);
if(total<=7) {
for(a=0;a<=7;a++) {
if(rut[0]==rut[a]) {
rutvalidado[0]='0';
rutvalidado[a+1]=rut[0];
}
else {
rutvalidado[a+1]=rut[a];
}
}
}
else
{
for(b=0;b<=7;b++) {
rutvalidado[b]=rut[b];
}
}
for(c=0;c<=7;c++) {
if(contador==2) {
acumulador=acumulador+((rutvalidado[c]-48)*contador);
contador=8;
}
else
{
acumulador=acumulador+((rutvalidado[c]-48)*contador);
}
contador=contador-1;
}
digito=(11-(acumulador%11));
if(digito>=10) {
if(digito==10) {
printf("\nEl digito verificador de su rut es: K"); }
else
{
printf("\nEl digito verificador de su rut es: 0");
}
}
else
{
printf("\nEl digito verificador de su rut es: %d", digito);
}
getchar();
getchar();
}
