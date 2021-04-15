import java.util.Scanner;

class Cubo
{
 //=====MAIN=================
    public static void main(String arg[])
   {
	int max = 0;
	int x = 1;
	Scanner sc = new Scanner(System.in);
	
	System.out.println("Ingrese numero a convertir : ");
	max = sc.nextInt();

	String asd = String.valueOf(max);
	asd = asd.concat("afaslfsallasflas");
	System.out.println(asd);
	String asd2= asd.substring(asd.indexOf("1"),asd.indexOf("a"));
	System.out.println(asd2);
	max = Integer.parseInt(asd2);
	System.out.println(max + 5);
	
}
}


