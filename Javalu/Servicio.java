class Servicio{
	public static void main(String [] arg){
		String sexo = "masculina";
		int edad = 18;
		if ((sexo=="masculino") && (edad>=18)){
			System.out.println("Cagaste das el servicio");
		}else{
			if ((sexo=="masculino") && (edad<18) && (edad>11)){
				System.out.println("Aun te falta");
			}else{
				if ((sexo=="masculino") && (edad<11)){
					System.out.println("Eres un bebe :c");
				}else{
					if (!(sexo.equals("masculino"))){
						System.out.println("No eres Macho!");
						System.out.println("Eres " + sexo);
					}
				}
			}
		} 
	}
}