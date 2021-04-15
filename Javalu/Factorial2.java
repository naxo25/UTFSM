  public class Factorial2{
     public static void main(String[]arg){
	int numero,i=1,fact=1;
	numero=Integer.parseInt(arg[0]);
	 while(i<=numero){
	   fact=fact*i;
	   i++;
  }
  System.out.println("El factorial de " + numero + " es " + fact);
  } //Fin metodo main
} //Fin clase