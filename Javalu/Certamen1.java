import java.util.*;

class Boleteria_Buses{
	
	
	
	public static void main (String[] args) {
		int opc, aux, punt;
		double monto;
		String nombre, cod_dest, pasajero, ida_vuelta, tipo_cl;
		boolean socio, resp;
		String destino[][]={{"D-01","Valdivia"},{"D-02","Temuco"},{"D-03","Concepcion"},{"D-04","Los Angeles"},{"D-05","Rancagua"},{"D-06","Santiago"},
							{"D-07","Los Vilos"},{"D-08","La Serena"},{"D-09","Copiapo"},{"D-10","Antofagasta"}};
		int valores[]={17000,14000,10000,8000,6000,4600,5500,10000,14000,17000};
		Scanner sc= new Scanner(System.in);
		
		do{
			System.out.print("\n   MENU   \n");
			System.out.print("Ingrese nombre pasajero: ");
			nombre= sc.nextLine();
			System.out.print("Codigo de destino: ");
			cod_dest= sc.nextLine();
			System.out.print("Viaje ida y vuelta?: ");
			ida_vuelta= sc.nextLine();
			System.out.print("Tipo de cliente: ");
			tipo_cl= sc.nextLine();
			System.out.print("Socio? (true o false): ");
			socio= sc.nextBoolean();
			
			pasajero=nombre.concat(cod_dest);
			if (socio){
				pasajero=pasajero.concat("*");
			}
			if (ida_vuelta.equals("si")){
				pasajero=pasajero.concat("#");
			}
			if (tipo_cl.equals("A") || tipo_cl.equals("B") || tipo_cl.equals("C")){
				pasajero.concat(tipo_cl);
			}
			
			monto= CalcularMonto(destino,valores,pasajero);	
			
			aux= pasajero.indexOf("D-");
			cod_dest = pasajero.substring(aux,aux+4);
			for (punt=0; punt<10; punt++){
				if (cod_dest.equals(destino[punt][0])){
					break;
				}
			}	
				
			System.out.println("\nDetalle Boleto: \n");
			System.out.println("Nombre: "+nombre);
			System.out.println("Destino: "+destino[punt][1]);
			System.out.println("Valor: "+monto);
			if (tipo_cl.equals("A")){
				System.out.println("Usted es muy buen cliente");
			}else{
				if (tipo_cl.equals("B")){
					System.out.println("Usted es buen cliente");
				}else{
					if (tipo_cl.equals("C")){
						System.out.println("Usted le queda poco para ser buen cliente, siga prefiriéndonos");
					}
				}
			}
		
			System.out.print("Desea seguir ingresando pasajeros? (true/false): ");
			resp= sc.nextBoolean();			
		}while(resp);
    }
    
    public static double CalcularMonto(String dest[][], int val[], String pasajero){
		int aux, punt, socio, ida_vuelta;
		double monto, descuento;
		String cod_dest, nombre;
		
		aux= pasajero.indexOf("D-");
		cod_dest= pasajero.substring(aux,aux+4);
		
		for (punt=0; punt<10; punt++){
			if (cod_dest.equals(dest[punt][0])){
				break;
			}
		}
		
		monto=val[punt];
		socio= pasajero.indexOf("*");
		if (socio!=-1){
			descuento=monto*0.15;
			monto=monto-descuento;
		}
		ida_vuelta= pasajero.indexOf("#");
		if (ida_vuelta==-1){
			monto=monto/2;
			descuento=monto*0.2;
			monto=monto+descuento;
		}
		
		return monto;
	}
}

