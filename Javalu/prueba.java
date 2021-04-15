import java.util.*;

public class prueba{
	public static void main (String[] args) {
		int p = 0;
		double Valor = 0;
		String nombre = "", codigo = "", tipo = "", es_socio = "", iv = "", city = "";
		String [][] Destino = {{"D-01","Valdivia"},{"D-02","Temuco"},{"D-03","Concepción"},{"D-04","Los Angeles"},{"D-05","Rancagua"}
		,{"D-06","Santiago"},{"D-07","Los Vilos"},{"D-08","La Serena"},{"D-09","Copiapó"},{"D-10","Antofagasta"}};
		int [] Valores = {17000,14000,10000,8000,6000,4600,5500,10000,14000,17000};
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Nombre: ");
		nombre = sc.nextLine();
		System.out.print("Codigo: ");
		codigo = sc.nextLine();
		System.out.print("Tipo: ");
		tipo = sc.nextLine();
		System.out.print("Es socio?(S/N) ");
		es_socio = sc.nextLine();
		for(int i = 0, j=0; i<Destino.length; i++){
			if(codigo.equals(Destino[i][j]) && es_socio.equals("S")){
				Valor = Valores[i] * 0.85;
				p = i;
			}else{
				if(codigo.equals(Destino[i][j])){
					Valor = Valores[i];
					p = i;
				}
			}
		}
		
		System.out.print("Ida y vuelta?(S/N) ");
		iv = sc.nextLine();
		if(iv.equals("S")){
			Valor = (Valor/2)*1.2 ;
		}
		
		
		if(es_socio.equals("S")){
			codigo = codigo.concat("*");
		}
		if(iv.equals("S")){
			codigo = codigo.concat("#");
		}
		System.out.println("Nombre: " + nombre);
		System.out.println("Destino: " + Destino[p][1]);
		System.out.println("Usted paga: " + Valor);
		System.out.println();
    }
}