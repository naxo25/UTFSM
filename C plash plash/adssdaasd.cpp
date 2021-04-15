#include <stdio.h>
#include <windows.h>


int recorrimiento(int a[],int p, int n){
    int i,j,araux[20],aux;
    for(i=0;i<p;i++){
        araux[i] = a[i];
    }

        if(p == 0){
        a[0] = n;
        p++;
    }else{
        if(p == 1){
                system("cls");
                printf("entra1");

            if(a[p-1] > n){
                aux = a[p - 1];
                a[p - 1] = n;
                a[p] = aux;
                p++;
            }else{
                a[p] = n;
                p++;
            }
        }else{
            if(p >= 2){
            if(n < a[0]){
                a[0] = n;
                for(i=1;i<p+1;i++){
                    a[i] = araux[i-1];
                }
                p++;
            }else{
                if(n > a[p - 1]){
                    a[p] = n;
                    p++;
                }else{
                    for(i=0;i < p; i++){
                        if(n > a[i] && n < a[i+1]){
                            a[i+1] = n;
                            for(j=i+2;j<p+1;j++){
                                a[j] = araux[j-1];
                            }
                            p++;
                        }
                    }
                }
            }
            }
        }

    }
    return p;
}
int imprimirmenu(int p){
    int x;
    system("cls");
    system("cls");
    printf("1.-AGREGAR NUMERO\n2.-QUITAR NUMERO\n3.-LISTAR\n4.-SALIR\nRESPUESTA: ");
    scanf("%d",&x);
    return x;
}

int buscar(int a[],int p,int n){
    int i,x;
    x = 0;
    for(i=0;i<p;i++){
        if(a[i] == n){
            x = 1;
            printf("ESTE NUMERO YA ESTA EN EL VECTOR..");
            getchar();
            getchar();
            break;
        }
    }
    return x;
}
int agregarnumero(int ar[],int punt){
    int aux,num,i,araux[20],j,s;
    s = 0;
    for(i=0;i<punt;i++){
        araux[i] = ar[i];
    }
    system("cls");
    printf("INGRESE NUMERO: ");
    scanf("%d",&num);
    s = buscar(ar,punt,num);
    if(s == 0){
       punt = recorrimiento(ar,punt,num);
    }
    return punt;

}

void listar(int ar[],int punt){
    int i;
    system("cls");
    for(i=0;i<punt;i++){
        printf("%d ",ar[i]);
    }
    getchar();
    getchar();
}

int quitar(int a[], int p){
    system("cls");
    int i,j, ab[20],x;
    printf("VECTOR: ");
    for(i=0;i<p;i++){
        printf("%d ",a[i]);
        ab[i] = a[i];
    }
    printf("\nINGRESE NUMERO A QUITAR: ");
    scanf("%d",&x);
    getchar();
    int c;
    c = 0;
    for(i=0;i<p;i++){
        if(x == a[i]){
            c = 1;
            for(j=i;j<p;j++){
                a[j] = ab[j+1];
            }
            p--;
            printf("\nEL NUMERO %d FUE ELIMINADO EXITOSAMENTE DEL VECTOR\n",x);
            getchar();
            break;
        }
    }
    if(c == 0){

        printf("NUMERO NO ENCONTRADO...");
        getchar();
        getchar();
    }
    return p;
}
int main(){
    int salir = 0,arreglo[20],puntero = 0;
    while (salir != 4){
        salir = imprimirmenu(puntero);
        if(salir == 1 && puntero > 19){
            system("cls");
            printf("VECTOR LLENO");
            getchar();
            getchar();
        }
        if(salir == 1 && puntero <= 19){
            puntero = agregarnumero(arreglo,puntero);
        }else{
            if(salir == 3) {
                listar(arreglo,puntero);
            }else{
                if(salir == 2){
                    puntero = quitar(arreglo,puntero);
                }
            }
        }
    }
    system("cls");
    //printf("el puntero quedo en %d\n", puntero);
    printf("CHAO PESCAO");
    getchar();
    getchar();
}
