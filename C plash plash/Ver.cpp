#include<stdio.h>
#include<string.h>
#include<process.h>


int rut(char x[12])
{
    if(strlen(x)==12)
    {
        return(1);
    }
    else
    {
        printf("\t\t\tEl Rut ingresado es incorrecto.\n\t\t\tIntentelo denuevamente\n\n");
        system("pause");
        system("cls");
        return(0);
    }
}

void main()
{
        char rt[12],resp;
        int n[9],i,j,sum,res,dv;

inicio:
        j=0;
        do{
                printf("\n\t\t\tIngrese el Rut a validar:\n");
                printf("\t\t\t------------------------\n");
                printf("\t\t\t   ");
                fflush(stdin);
                gets(rt);
        }while(rut(rt)==0);
        if(strlen(rt)==12)
        {
                for(i=0;i<=11;i++)
                {
                        switch(rt[i])
                        {
                        case '0':n[j]=0;
                            j++;break;
                        case '1':n[j]=1;
                            j++;break;
                        case '2':n[j]=2;
                            j++;break;
                        case '3':n[j]=3;
                            j++;break;
                        case '4':n[j]=4;
                            j++;break;
                        case '5':n[j]=5;
                            j++;break;
                        case '6':n[j]=6;
                            j++;break;
                        case '7':n[j]=7;
                            j++;break;
                        case '8':n[j]=8;
                            j++;break;
                        case '9':n[j]=9;
                            j++;break;
                        }
                }
                sum=n[7]*2+n[6]*3+n[5]*4+n[4]*5+n[3]*6+n[2]*7+n[1]*2+n[0]*3;
                res=sum%11;
                dv=11-res;
                if(dv==10)
                {
                        if(rt[11]=='K'||rt[11]=='k')
                        {
                                printf("\n\t\t\tRut Valido\n\n");
                                system("pause");
                                system("cls");

                        }
                        else
                        {
                                printf("\n\t\t\tRut Invalido\n\n");
                                system("pause");
                                system("cls");

                        }
                }
                if(dv==11)
                {
                        if(rt[11]=='0')
                        {
                                printf("\n\t\t\tRut Valido\n\n");
                                system("pause");
                                system("cls");

                        }
                        else
                        {
                                printf("\n\t\t\tRut Incorrecto\n\n");
                                system("pause");
                                system("cls");

                        }
                }
                if(dv==n[8])
                {
                        printf("\n\t\t\tRut Valido\n\n");
                        system("pause");
                        system("cls");
                }
                else
                {
                        printf("\n\t\t\tRut Incorrecto\n\n");
                        system("pause");
                        system("cls");
                }
        }
        do{
            printf("\n\t\tDesea realizar nuevamente la operacion? <s/n>\t");
            scanf("%c",&resp);
            fflush(stdin);
            system("cls");
        }while(resp!='S' && resp!='s' && resp!='n' && resp!='N');
        if(resp=='S' || resp=='s')
        {
            goto inicio;
            system("cls");
        }
        else
        {
            printf("\n\t\t\tAdios\n\n");
        }
        }
