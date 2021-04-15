import java.util.*;

class matriz{
	public static void main (String[] args) {
		int [][] matrix = new int [4][12];
		matrix = poblar();
		
    }
    public static int [][] poblar(){
    	int [][] ar = new int [4][12];
    	Random num = new Random();
    	for(int i=0; i<4; i++){
    		for(int j=0; j<12; j++){
    			ar[i][j] = (int)(num.nextDouble() * 150 + 1);
    		}
    	}
    return ar;
    }
}