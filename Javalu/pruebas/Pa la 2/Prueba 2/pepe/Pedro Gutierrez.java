
import java.util.*;

class Pedro{
	//Pedro Gutierrez Muñoz 392-B
	public static void main (String[] args) {
    	Scanner sc = new Scanner(System.in);
    	int valorP;
    	float valorC;
    	int rue,pue,com,capC;
    	String pla,mar;
    	double impC;
    	
    	Bus b1 = new Bus();
    	
    	System.out.println("~Ingresar Bus~");
    	System.out.print("Ruedas: ");
    	b1.setRuedas(sc.nextInt());
    	System.out.print("Puertas: ");
    	b1.setPuertas(sc.nextInt());
    	System.out.print("Placa: ");
    	b1.setPlaca(sc.next());
    	System.out.print("Marca: ");
    	b1.setMarca(sc.next());
    	System.out.print("Combustible: ");
    	b1.setCombustible(sc.nextInt());
    	System.out.print("Pasajeros: ");
    	b1.setPasajeros(sc.nextInt());
    	System.out.print("Tipo pasajero: ");
    	b1.setTipoP(sc.nextInt());
    	System.out.print("Valor combustible: ");
    	valorC=sc.nextFloat();
    	
    	valorP=b1.valorPago();
    	
    	System.out.println(b1.mostrarDatos()+"Valor pago: "+valorP+"\n"+"Valor Combustible: "+b1.calcularPrecioC(valorC)+"\n");
    	
    	System.out.println("~Ingresar Camion~");
    	System.out.print("Ruedas: ");
    	rue=sc.nextInt();
    	System.out.print("Puertas: ");
    	pue=sc.nextInt();
    	System.out.print("Placa: ");
    	pla=sc.next();
    	System.out.print("Marca: ");
    	mar=sc.next();
    	System.out.print("Combustible: ");
    	com=sc.nextInt();
    	System.out.print("Capacidad Carga: ");
    	capC=sc.nextInt();
    	System.out.print("Impuesto Carga: ");
    	impC=sc.nextDouble();
    	System.out.print("Valor combustible: ");
    	valorC=sc.nextFloat();
    	
    	Camion C1 = new Camion(rue,pue,pla,mar,com,capC,impC);
    	
    	impC=C1.calcularImpuestos();
    	System.out.println(C1.mostrarDatos()+"Capacidad Carga: "+C1.getCapacidadC()+"\n"+"Impuestos: "+impC+"\n"+"Valor Combustible: "+b1.calcularPrecioC(valorC)+"\n");
    }
}