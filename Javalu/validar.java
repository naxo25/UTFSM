import java.util.*;

class validar{
	public static void main(String [] arg){
		byte edad = 101;

		Scanner sc = new Scanner(System.in);
		
		

		while(edad>100){
			System.out.print("Ingrese edad a validar: ");
			edad = sc.nextByte();
			if (edad<100){
				System.out.println("Edad correcta!");
			}else{
				System.out.println("Edad Icorrecta!");
			}
		}
	}
	
}