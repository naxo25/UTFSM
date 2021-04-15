import java.io.*;

class Ingreso{
	
	public static void main (String args[]){
	
	BufferedReader bf=new BufferedReader(new InputStreamReader(System.in));
	String nom="";
	System.out.println("Ingrese nombre: ");
	try{
		nom=bf.readLine();
	}catch (IOException e){
		System.out.println("error en ingreso");
	}
	System.out.println("Nombre Ingresado: " + nom);
    }
}