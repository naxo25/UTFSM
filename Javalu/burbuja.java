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
   		int a�os [] = new int [4];
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
   			a�os[i] = prom;
   			System.out.println(a�os[i] + " es el promedio del a�o " + i);
   		}
   		return a�os;
   	}
   	
   	public static int promedio(int [][] numeros){
   		int prom = 0;
   		for(int i=0; i<4; i++){
   			for(int j=0; j<12; j++){
   				prom += numeros[i][j];	
   		}	
   	}
   	System.out.print("el promedio del a�o " + prom);
   	return prom;
}
}