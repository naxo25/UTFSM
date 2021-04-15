import java.util.Scanner;
public class AlejandroCortes {
        
	//ALEJANDRO CORTES MOLINA 392-A//
    public static void main(String[] args) {
    	
    	float cA;
    	byte opcion;
		boolean continuar=false;
        Scanner sc=new Scanner(System.in);

	    Vivienda v = new Vivienda(3,2,"San Matin 985",100000,30);
	    
	    while (continuar == false){
	   		
	    	System.out.println("Datos Particulares");
	    	System.out.println("[1]Departamento");
	    	System.out.println("[2]Casa");
	    	System.out.println("[3]Salir");
	    	opcion=sc.nextByte();
	    	switch (opcion){
	    		case 1: Departamento d = new Departamento();
	    				System.out.print("Ingrese Metros Bodega : ");
	    				d.mtsBod=sc.nextFloat();
	    				System.out.print("Ingrese Metros Estacionamiento : ");
	    				d.mtsEst=sc.nextFloat();
	    			    System.out.println(v.informacionViv());
	    				System.out.println(d.informacionViv());
	    				System.out.print("Valor Contribuciones : $");
	    				System.out.println(d.pagoContribuciones(v.dividendo, v.mtsViv, d.mtsBod, d.mtsEst));
	    				System.out.print("Valor Gastos Comunes : $");
	    				System.out.println(d.gastosComunes(v.mtsViv,d.mtsBod,d.mtsEst));
	    				System.out.print("TOTAL : $");
	    			    System.out.println(d.pagoContribuciones(v.dividendo, v.mtsViv, d.mtsBod, d.mtsEst)+d.gastosComunes(v.mtsViv,d.mtsBod,d.mtsEst));
	    				
	    		break;
	    		case 2:	System.out.print("Ingrese Valor Cuota Aseo : ");
	    				cA=sc.nextFloat();
	    				Casa c = new Casa(cA);
	    				System.out.println(v.informacionViv());
	    				System.out.println(c.informacionViv());
	    			    System.out.print("Valor Contribuciones : $");
	    			    System.out.println(c.pagoContribuciones(v.dividendo));
	    			    System.out.print("TOTAL : $");
	    			    System.out.println(c.cuotaAseo + c.pagoContribuciones(v.dividendo));
	    			    
	    		break;
	    		case 3:continuar=true;
	    		break;
	    		default : System.out.println("Opcion Invalida!");
	    	}
	    			
	   
	    }
	    
    }
}
