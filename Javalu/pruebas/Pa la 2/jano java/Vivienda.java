public class Vivienda {
	public 
		int	numDormitorio, numBaños;
		String direccion;
		float dividendo, mtsViv;
	public Vivienda(){
		
	}
    public Vivienda(int nD, int nB, String dir, float div, float mV){
    	numDormitorio=nD;
    	numBaños=nB;
    	direccion=dir;
    	dividendo=div;
    	mtsViv=mV;
    }
    

    public float pagoContribuciones(float dividendo){
    	
		return dividendo*0.1f;
	}

	public String informacionViv(){
		return "NºDormitorios : " + numDormitorio + " NºBaños : " + numBaños + " Direccion : "+direccion+" Dividendo : "+dividendo+" Mts Vivienda " + mtsViv;
	}


}