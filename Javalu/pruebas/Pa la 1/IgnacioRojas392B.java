import java.util.*;

class IgnacioRojas392B{
	public static void main (String[] args) {
		Scanner sc = new Scanner(System.in);
		String [] pacientes = {"14835165-6","12478965-8","17854369-k","07072365-4","06854369-k"}; 
		String [] prevision = {"FNS A 0%","FNS B 25%","FNS C 50%","FNS D 75%","ISAPRES 90%"};
		
		String op = "S", nombre, rut, tipo, sexo, nivel = "", guardar ="", dato1;
		while(op.equals("S")){
			System.out.print("Nombre | Rut | Sexo | Prevision: ");
			guardar = sc.nextLine();
			nombre = guardar.substring(0,guardar.indexOf(" ") + 1);
			guardar = guardar.substring(guardar.indexOf(" ") + 1);
			nombre = nombre.concat(guardar.substring(0,guardar.indexOf(" ")));
			guardar = guardar.substring(guardar.indexOf(" ") + 1);
			rut = guardar.substring(0,guardar.indexOf(" "));
			guardar = guardar.substring(guardar.indexOf(" ") + 1);
			sexo = guardar.substring(0,1);
			guardar = guardar.substring(guardar.indexOf(" ") + 1);
			tipo = guardar;
			
			int pos = buscar(pacientes,rut);
			double por = 1;
			if(pos != -1){
				if(tipo.equals("FNS")){
					System.out.print("¿Cual es su Nivel?: ");
					nivel = sc.nextLine();
				}
				por = porcentaje(prevision,tipo,pos,nivel);
			}
			
			System.out.println("****************** Consulta de Urgencia ***********************");
			System.out.print("Nombre: " + nombre + "************ ");
			System.out.println("Rut: " + rut);
			System.out.println("Valor a cancelar " + (calcularValor(por)));
			
			System.out.print("Desea Seguir? ");
			op = sc.nextLine();
			
		}
	}
	
	public static double calcularValor(double por){
		double dato = 0;
		dato = 25000 * por;
		return dato;
	}
	
	public static double porcentaje(String [] prevision, String tipo, int pos, String nivel){
	  double dato = 0.9, numero; String numerostring, nv, pre;
	  for(int i=0; i<4; i++){
	  	pre = prevision[i].substring(0,3);
		nv = prevision[i].substring(4,5);
		  if(tipo.equals(pre) && nivel.equals(nv)){
			numerostring = prevision[i].substring(6,prevision[i].indexOf("%"));
			dato = Integer.parseInt(numerostring);
			dato = dato/100;
		  }
	 	}
	  return dato;
	}
	
	public static int buscar(String [] pacientes, String rut){
		int ex = -1;
		for(int i=0; i<5; i++){
			if(rut.equals(pacientes[i])){
				ex = i;
			}
		}
		return ex;
	}
	
}