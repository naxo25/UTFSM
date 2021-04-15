import java.util.Scanner;

class Promedio
{
  //metodo promediar
   public static double Promedio (double nota1,double nota2 ,double nota3)
   {
    double resul = 0;
    resul = (nota1*0.25)+(nota2*0.35)+(nota3*0.4);
    return resul;
     
   }

 //=====MAIN=================
    public static void main(String arg[])
   {
     double nota1,nota2,nota3,resultado;
     String nombre,asignatura;
     Scanner sc = new Scanner(System.in);
     
     System.out.println("Ingrese Nombre : " );
     nombre = sc.nextLine();
              
     System.out.println("Ingrese Nombre : " );
     asignatura = sc.nextLine();
              
     System.out.println("Ingrese Nota1 : " ); nota1 = sc.nextDouble();
     System.out.println("Ingrese Nota2 : " ); nota2 = sc.nextDouble();     
     System.out.println("Ingrese Nota3 : " ); nota3 = sc.nextDouble();

     resultado = Promedio(nota1,nota2,nota3);
     System.out.println("Promedio =  " + resultado);
     
   }
}