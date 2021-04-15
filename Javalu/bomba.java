import java.util.*;

class Bomba{
	
	static void venta () {
		byte sw;
		
		System.out.println("\n ")
	}
	
	
	
	
	public static void main (String[] args) {
		
		byte opc;
		String Arreglo [][]={{"93 Octanos","$599"},{"95 Octanos","$605"},{"97 Octanaje","$615"}};
		
		Scanner sc = new.Scanner(System.in);
		
		do{
			System.out.println("1.- Venta de Gasolina.");
			System.out.println("2.- Monto Acumulado.");
			System.out.println("3.- Octanaje mas vendido.");
			System.out.println("4.- Salir(0)");
			
			opc = sc.nextbyte();
			
			switch (opc){
				case 1: venta();
					break;
				case 2: monto();
					break;
				case 3: octanaje();
					break;
				case 4: salir();
					break;
				default System.out.println("ERROR WN");
					break; 
			}
		}while (opc!=0);	
	}
}