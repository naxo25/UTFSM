import java.util.Random;
public class burbuja{

    public static void main(String arg []) {
    	int ar[][] = new int [4][12];
    	ar=poblar();
    	promedioanual(ar);
    	promedio(ar);
    } 
   
   	public static int[][] poblar(){
   		int numeros[][] =new int[4][12];
   		Random x = new Random();
   		for(int i=0; i<4; i++){
    		for(int j=0; j<12; j++){
    			numeros[i][j] = (int)(x.nextDouble()*100+1);
    		}
    	}
   		return numeros;
   	}
   	
   	public static int[] promedioanual(int [][] numeros){
   		int años [] = new int [4];
   		for(int i=0; i<4; i++){
   			int prom = 0;
   			for(int j=0; j<12; j++){
   				if(j<11){
   				System.out.print(numeros[i][j] + " + ");
   				}else{
   					System.out.print(numeros[i][j] + " = ");
   				}
   				prom += numeros[i][j];
   			}
   			años[i] = prom;
   			System.out.println(años[i] + " es el promedio del año " + i);
   		}
   		return años;
   	}
   	
   	public static int promedio(int [][] numeros){
   		int prom = 0;
   		for(int i=0; i<4; i++){
   			for(int j=0; j<12; j++){
   				prom += numeros[i][j];	
   		}	
   	}
   	System.out.print("el promedio del año " + prom);
   	return prom;
}
}