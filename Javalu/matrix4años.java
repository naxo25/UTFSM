import java.util.*;

public class matrix4a�os {
	public static void main(String arg []) {
    	int ar[][] = new int [4][12];
    	ar=poblar();
    	promedio(ar);
    	promedioanual(ar);
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
   				prom += numeros[i][j];
   			}
   			a�os[i] = prom;
   			System.out.println(a�os[i] + " es el promedio del a�o 201" + i);
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
   	System.out.println("el promedio del a�o " + prom);
   	return prom;
	}
	    
}