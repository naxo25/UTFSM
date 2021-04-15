import java.util.*;

public class IgnacioRojas392B {

	public static void main (String[] args) {
		String op = "S";
		short Cap = 15;
		Byte Grados, Anio;
		Scanner sc = new Scanner(System.in);
		Bebida B = new Bebida("Rico","Sprite-cola","Fantashop",Cap,6500);
		
		do{
			System.out.print("Ingrese Año: ");
			Anio = sc.nextByte();
			System.out.print("Ingrese Grados: ");
			Grados = sc.nextByte();
			BebidaA A = new BebidaA(Grados,Anio);
			System.out.println("*********************************************************************");
			System.out.println(B.datos() + A.CalcularP(B.Precio) + A.datos());
			System.out.println("*********************************************************************");
			BebidaG G = new BebidaG();
			System.out.print("Tipo : ");
			G.Tipo = sc.nextLine();
			System.out.print("Fecha : ");
			G.FechaV = sc.nextLine();
			System.out.println(B.datos() + G.datos());
			System.out.print("Desea continuar? ");
			op = sc.nextLine();
		}while (op.equals("S"));
	}
	
}