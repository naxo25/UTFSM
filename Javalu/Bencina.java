import java.util.*;

public class Bencina{
	public static void main (String[] args) {
		int [][] mx = {{93,599},{95,605},{97,615}};
		double valor = venta(mx);
		System.out.println(valor);
	}
	public static double venta(int [][] mx){
		Scanner sc = new Scanner(System.in);
		System.out.print("Octanaje? : ");
		int octanaje = sc.nextInt();
		System.out.print("Litros? : ");
		int litros = sc.nextInt();
		double valor = 0; int c =1;
		for(int i=0, j=0; i<3; i++){
			if(octanaje == mx[i][j]){
				valor = mx[i][c];
				valor = valor * litros;
			}
		}
	return valor;
	}
	
}