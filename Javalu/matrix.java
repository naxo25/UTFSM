import java.util.*;

class matriz{
	public static void main (String[] args) {
		int [][] matrix = new int [4][12];
		int [] promanual = new int [4];
		matrix = poblar();	
		System.out.println("El promedio de los 4 años es : " + promedio(matrix));
    	System.out.println();
		promanual = promedioanual(matrix);
		peoresmeses(matrix);
		
		
    }
    public static int [][] poblar(){
    	int [][] ar = new int [4][12];
    	Random num = new Random();
    	for(int i=0; i<4; i++){
    		for(int j=0; j<12; j++){
    			ar[i][j] = (int)(num.nextDouble() * 150 + 1);
    			System.out.print(ar[i][j] + " ");
    		}
    		System.out.println();
    	}
    System.out.println();
    return ar;
    }
    public static double promedio(int [][] m){
    	double prom = 0;
    	for(int i=0; i<4; i++){
    		for(int j=0; j<12; j++){
    			prom += m[i][j];
    		}
    	}
    return prom/4;
    }
    public static int [] promedioanual(int [][] mx){
    	int [] m = new int [4];
    	int prom;
    	for(int i=0; i<4; i++){
    		prom = 0;
    		for(int j=0; j<12; j++){
    			prom += mx[i][j];
    		}
    	m[i] = prom;
    	System.out.println("Valor del año 201" + i + " es = " + m[i]);
    	}
    System.out.println();
    return m;
    }
    public static int[] peoresmeses(int [][] mx){
    	int [] m = new int [12];
    	int prom;
    	for(int j=0; j<12; j++){
    		m[j] = 20000;
    		for(int i=0; i<4; i++){
    			if(mx[i][j] < m[j]){
    				m[j] = mx[i][j];
    			}
    		}
    	System.out.println("El peor valor del mes " + j + " es = " + m[j]);
    	}
    System.out.println();
    return m;
    }
}