import java.util.Scanner;

class año
{
    public static void main(String arg[])
   {
     byte mes, dias; String nombre; int ano;
     Scanner sc = new Scanner(System.in);

     System.out.println("Ingrese mes : " );
     mes = sc.nextByte();
     System.out.println(mes);
     System.out.println("Ingrese año : " );
     ano = sc.nextInt();
     System.out.println(ano);

     dias = 0;
     switch(mes){
	case 1: case 11: case 12: case 7: case 8: case 9:
		dias = 31; break;
	case 3: case 4: case 5: case 6: case 10:
		dias = 30; break;
	case 2:
		if (((ano % 4 == 0) && (ano % 100 != 0)) || (ano % 400 == 0)){
		dias = 29 ; } else { dias = 28 ;
		break;}

	default:
		System.out.println("El mes no existe");
		break;
	}

	System.out.println("El mes " + mes + " del ano " + ano + " tiene " + dias + " dias");
   }
}