import java.util.*;

public class pruebav2{
	public static void main (String[] args) {
	String Destino [][] = {{"D-01","Valdivia"},{"D-02","Temuco"},{"D-03","Concepción"},{"D-04","Los Angeles"},{"D-05","Rancagua"}
						  ,{"D-06","Santiago"},{"D-07","Los Vilos"},{"D-08","La Serena"},{"D-09","Copiapó"},{"D-10","Antofagasta"}};
	int Valores [] = {17000,14000,10000,8000,6000,4600,5500,10000,14000,17000};
	String nombre, codigo, tipo="", es_socio, iv;
	Scanner sc = new Scanner(System.in);
	
	System.out.print("Ingrese nombre: ");
	nombre = sc.nextLine();
	System.out.print("Ingrese codigo: ");
	codigo = sc.nextLine();
	System.out.print("Ingrese tipo del socio: ");
	tipo = sc.nextLine();
	System.out.print("Es socio?(S/N): ");
	es_socio = sc.nextLine();
	System.out.print("Ida y vuelta?(S/N): ");
	iv = sc.nextLine();
	
	int pos = buscar(Destino,codigo);
	
	if(es_socio.equals("S")){
		codigo = codigo.concat("*");
	}
	if(iv.equals("N")){
		codigo = codigo.concat("#");
	}
	double monto = calcular(es_socio,iv,pos,Valores);
	
	System.out.println("Nombre: " + nombre);
	System.out.println("Destino: " + Destino[pos][1]);
	System.out.println("Valor: " + monto);
	System.out.println("Usted " + mensaje(tipo));
    }
    
    public static int buscar(String [][] Destino, String cod){
    	int b = 0, i, j;
    	for(i = 0, j = 0; i < Destino.length; i++){
    		if(cod.equals(Destino[i][j])){
    			b = i;
    		}
    	}
    	return b;
	}
    
    public static double calcular(String a, String b, int pos, int [] Valores){
    	double Valor = Valores[pos];
    	if(a.equals("S")){
    		Valor = Valor * 0.85;
    	}
    	if(b.equals("S")){
    		Valor = (Valor/2) * 1.2;
    	}
    return Valor;
    }
    
    public static String mensaje(String tipo){
    	if(tipo.equals("A")){
    		return "es muy buen cliente";
    	}
    	if(tipo.equals("B")){
    		return "es muy buen cliente, pero le falta";
    	}
    	if(tipo.equals("C")){
    		return "es muy mal cliente";
    	}else{
    		return "no es nadie";
    	}
    }
}