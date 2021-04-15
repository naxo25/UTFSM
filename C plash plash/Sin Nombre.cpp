#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

main ()
{
     srand (time(NULL));
       
     int clave,numero,c1,c2,c3,n1,n2,n3,i=1,toque,fama,menu2,opc,lvl;
     int menu,opc2,intentos;
     
     printf ("Toque y Fama\n");
     clave = (rand ()%899+100);
     printf ("\nIngrese nivel: ");
     scanf ("%d",&lvl);
    
    if (lvl==1)
    	intentos = 9;
    if (lvl==2)
    	intentos = 6;
    if (lvl==3)
    	intentos = 4;
    
     printf ("\n\n\nIntenta adivinar el numero\nIngrese un numero de tres cifras: ");
     scanf ("%d",&numero);
     if ((numero<99)||(numero>1000))
      
        printf ("error, el numero ingresado no es de tres cifras");
   
     else
     {   
          while ((numero!=clave) && (intentos>0))
          {     
                 c1= clave/100;
                 c2= (clave%100-clave%100%10)/10; //te devuelve 0 = 100/10
                 c3= clave%100%10;
               
                 intentos--;   
                 
		 n1= numero/100;
                 n2= (numero%100-numero%100%10)/10;
                 n3= numero%100%10;
                
                 toque = 0;
                 fama  = 0;
         
          if ((n1==c1)||(n2==c2)||(n3==c3)||(n1==c2)||(n1==c3)||(n2==c1)||(n2==c3)||(n3==c1)||(n3==c2))
         
          {  
		       
          if (n1==c1)
             fama++;                    
          if (n2==c2)
             fama++;       
          if (n3==c3)
             fama++;         
          if (n1==c2)
             toque++;     
          if (n1==c3)
             toque++;        
          if (n2==c1)
             toque++;           
          if (n2==c3)
             toque++;           
          if (n3==c1)
             toque++;
          if (n3==c2)
             toque++;
                                   
          if (toque==1)
             printf ("Tu tienes un toque\n");
         
          if (toque==2||toque==3)
              printf ("Tu tienes %d toques\n",toque);
         
         
          if (fama==1)
             printf ("tu tienes una fama\n");
         
          if (fama==2||fama==3)
              printf ("tu tienes %d famas\n",fama);        
          }
         
          else
               {
               printf ("\nNo tienes ningun acierto intentalo nuevamente");}
        
          printf ("\n\nIngresa un nuevo numero: ");
          scanf ("%d",&numero); 
         
          i++;      
          }
      }
      if (intentos>0)
      	printf ("has acertado\nTe demoraste %d Turnos\n",i);
      	else 
      		{printf("\nPerdiste, te has quedado sin intentos\n\n"); }
      system ("pause");
     }
