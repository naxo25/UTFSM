public class Vivienda {
	public 
		int	numDormitorio, numBa�os;
		String direccion;
		float dividendo, mtsViv;
	public Vivienda(){
		
	}
    public Vivienda(int nD, int nB, String dir, float div, float mV){
    	numDormitorio=nD;
    	numBa�os=nB;
    	direccion=dir;
    	dividendo=div;
    	mtsViv=mV;
    }
    

    public float pagoContribuciones(float dividendo){
    	
		return dividendo*0.1f;
	}

	public String informacionViv(){
		return "N�Dormitorios : " + numDormitorio + " N�Ba�os : " + numBa�os + " Direccion : "+direccion+" Dividendo : "+dividendo+" Mts Vivienda " + mtsViv;
	}


}