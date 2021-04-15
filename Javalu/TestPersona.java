import java.util.*;

class TestPersona{
	public static void main (String[] args) {
	Scanner sc = new Scanner(System.in);
    //	Persona p1 = new Persona();
    	
    	
    	String rut,nombre,direc;
    	byte edad;
    	char sexo;
    	
    	System.out.print("Ingrese Rut: ");
    	rut=sc.nextLine();
    	System.out.print("Ingrese Nombre: ");
    	nombre=sc.nextLine();
    	System.out.print("Ingrese Edad: ");
    	edad=sc.nextByte();
    	System.out.print("Ingrese Sexo(F/M): ");
    	sexo=sc.next().charAt(0);
    	System.out.print("Ingrese Direccion: ");
    	direc=sc.next();
    	
    	Persona p2 = new Persona(rut,nombre,edad,sexo,direc);
    	
    	System.out.println("\nRut: "+p2.getRut());
    	System.out.println("Nombre: "+p2.getNombre());
    	System.out.println("Edad: "+p2.getEdad());
    	System.out.println("Sexo: "+p2.getSexo());
    	System.out.println("Direccion: "+p2.getDirec());
    	
    /*	p1.setRut(rut);
    	p1.setNombre(nombre);
    	p1.setEdad(edad);
    	p1.setSexo(sexo);
    	
    	System.out.println("\nRut: "+p1.getRut());
    	System.out.println("Nombre: "+p1.getNombre());
    	System.out.println("Edad: "+p1.getEdad());
    	System.out.println("Sexo: "+p1.getSexo()); */
    }
}