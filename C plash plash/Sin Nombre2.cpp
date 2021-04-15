#include <stdio.h>
#include <conio.h>
#include <windows.h>

void gotoxy(int x,int y){
HANDLE hCon;
hCon = GetStdHandle(STD_OUTPUT_HANDLE);
COORD dwPos;
dwPos.X = x;
dwPos.Y = y;
SetConsoleCursorPosition(hCon,dwPos);
}
int main(){
int a[6][20],i=10,j=10,b,d=1,aux,tecla,q,w;
int save[6];

for(i=0;i<6;i++){
    save[i] = 0;
}

for(i=0;i<6;i++){
    for(j=0;j<20;j++){
        a[i][j] = 1;
    }
}
for(i=0;i<6;i++){
    j = 1 + rand() % 19;
    a[i][j] = 0;
}
for(i=0;i<6;i++){
    for(j=0;j<20;j++){
        printf("%d",a[i][j]);
    }
    printf("\n");
}

for(i=0;i<6;i++){
gotoxy(50,i);
printf("INGRESE NUMERO DE CLAVE: ");
scanf("%d",&b);
for(j=0;j<20;j++){
    if(a[i][j]==0){
        aux = j;
        if(b > 0){
        b = aux + b;

            for(d = aux;d<b;d++){
             a[i][d] = 1;
                gotoxy(d,i);
                printf("%d",a[i][d]);
                Sleep(300);
                a[i][d+1] = 0;
                gotoxy(d+1,i);
                printf("%d",a[i][d+1]);
                Sleep(300);}
        break;
        }else{
        b = aux + b;
        for(d = aux;d > b;d--){
        a[i][d] = 1;
                gotoxy(d,i);
                printf("%d",a[i][d]);
                Sleep(300);
                a[i][d-1] = 0;
                gotoxy(d-1,i);
                printf("%d",a[i][d-1]);
                Sleep(300);}
                
}}}
    if (save[0]=0)
       save[0] = b;
    else{
    if (save[1]=0)
       save[1] = b;
    else{   
    if (save[2]=0)
       save[2] = b;
    else{
    if (save[3]=0)
       save[3] = b;
    else{
    if (save[4]=0)
       save[4] = b;
    else{
    if (save[5]=0)
       save[5] = b;}
    }}}}
}

    gotoxy(10,10);
    if ((save[0]==save[1])||(save[2]==save[3])||(save[4]==save[5])||(save[0]==save[5])||(save[0] > 0)||(save[1]==save[3])||(save[2]==save[4])){
      printf ("Abierto\n");}
      else{ printf ("Cerrado\n");}

getchar();
Sleep(1500);
}
