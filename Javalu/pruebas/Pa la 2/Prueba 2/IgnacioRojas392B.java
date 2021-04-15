import java.util.*;

public class IgnacioRojas392B {
	
	public static void main (String[] args) {
		
		Scanner Sc = new Scanner(System.in);
		int CapCarga, Precio, TipoP, Pasajeros;
		float ImpCarga;
		int Ruedas, Puertas, Combustible;
		String Placa, Marca;
		
		System.out.print("Ingrese numero de ruedas: ");
		Ruedas = Sc.nextInt();
		System.out.print("Ingrese numero de puertas: ");
		Puertas = Sc.nextInt();
		System.out.print("Ingrese numero de placa: ");
		Placa = Sc.nextLine();
		Placa = Sc.nextLine();
		System.out.print("Ingrese marca: ");
		Marca = Sc.nextLine();
		System.out.print("Ingrese litros: ");
		Combustible = Sc.nextInt();
		
		
		Vehiculos V = new Vehiculos(Ruedas, Puertas, Placa, Marca, Combustible);
		System.out.print("Ingrese precio de combustible: ");
		Precio = Sc.nextInt();
		System.out.println("El precio del combustible es: " + V.CalcularPrecioC(Precio));
		
		Bus B = new Bus();
		System.out.print("\nIngrese pasajeros: ");
		Pasajeros = Sc.nextByte();
		System.out.print("Ingrese tipo de pago (1 o 2): ");
		TipoP = Sc.nextByte();
		B.setPasajeros(Pasajeros);
		B.setTipoP(TipoP);
		System.out.println(B.mostrarDatos());
		
		System.out.print("\nIngrese capacidad de carga: ");
		CapCarga = Sc.nextInt();
		Camion C = new Camion(CapCarga);
		C.CalcularImpuesto();
		System.out.print(V.mostrarDatos() + C.mostrarDatos());
				
		
		
		/*System.out.println("Numero de Ruedas: " + V.getRuedas());
		System.out.println("Numero de Puertas: " + V.getPuertas());
		System.out.println("Numero de Placa: " + V.getPlaca());
		System.out.println("Marca: " + V.getMarca());
		System.out.println("Combustible: " + V.getCombustible());*/
		
	}
}