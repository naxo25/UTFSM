import java.util.*;

class Pedro{
	
	public static void main (String[] args) {
		Scanner sc= new Scanner(System.in);
		String paciente, rut, prev, resp, porcentaje="", nombre, sexo;
		String pacientes[]={"14835165-6","12478965-8","17854369-K","07072365-4","06854369-K"};
		String prevision[]={"FNS A 0% ","FNS B 25%","FNS C 50%","FNS C 50%","FNS D 75%","ISAPRES 90%"};
		int punt_guion=0, i;
		double porc, monto;
		boolean existe=false;
		
		do{
		
			System.out.print("Nombre | Rut | Sexo | Prevision: ");
			paciente= sc.nextLine();
			paciente= paciente.concat("     ");
			
			punt_guion=paciente.indexOf("-");
			rut= paciente.substring(punt_guion-8,punt_guion+2);
		
			for (i=0; i<5; i++){
				if (rut.equals(pacientes[i])){
					existe=true;
				}
			}
			
			if (existe){
				prev= paciente.substring(punt_guion+12,paciente.length());
				prev= prev.trim();
				for (i=0; i<5; i++){
					if (prev.equals(prevision[i].substring(0,5))){
						porcentaje=prevision[i].substring(6,9);
					}
				}
				
				if (prev.equals("")){
					porc=100;
				}else{
				
					if (!prev.substring(0,3).equals("FNS")){
						porc=90;
					}else{
						punt_guion=porcentaje.indexOf("%");
						porcentaje=porcentaje.substring(0,punt_guion);
						porc= Integer.parseInt(porcentaje);
					}
				}			
			}else{
				porc=100;
			}
			
			monto= CalcularValor(porc);
			
			punt_guion=paciente.indexOf("-");
			nombre=paciente.substring(0,punt_guion-9);
			sexo= paciente.substring(punt_guion+3, punt_guion+12);
						
			
			System.out.println("\n********** Consulta de urgencia **********\n");
			System.out.println("Nombre paciente: "+nombre+" ****** Sexo: "+sexo);
			System.out.println("Valor a cancelar: $"+monto);
			
			
			System.out.print("Desea seguir ingresando pasientes? (S/N): ");
			resp= sc.nextLine();
			
		}while(resp.equals("S"));
		
			
	}
	
	public static double CalcularValor(double porc){
		double monto=25000;
		
		porc=(porc/100);
		monto=(monto*porc);
		return monto;
	}
}