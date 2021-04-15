import java.util.Scanner;

class operaciones{
	public static int sumar(int x, int y){
		return x + y;
	}
	public static int restar(int x, int y){
		return x - y;
	}
	public static double dividir(double x, double y){
		return x / y;
	}
	
	public static void main(String arg[]){
		double num1, num2;
		double res;
		Scanner sc = new Scanner(System.in);
		System.out.print("Numero 1: ");
		num1 = sc.nextDouble();
		System.out.print("numero 2: ");
		num2 = sc.nextDouble();
		
		res = dividir(num1,num2);
		System.out.println("El resultado es: " + res);
	}
}