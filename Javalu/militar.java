class milico{
	public static void main (String arg[]){
		String sexo; int edad; sexo="masculino"; edad = 18;
		if (edad < 11) {System.out.println("bebe");}
		else{ 
		if ((edad <= 17) && (edad >= 11)){ System.out.println("Aun falta");}
			else{
			if (edad >= 18){ System.out.println("Ganaste, Te fuiste al servicio");}
			}
		}
	}
}