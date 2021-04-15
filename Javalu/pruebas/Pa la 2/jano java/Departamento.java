public class Departamento extends Vivienda {
	public 
		float mtsBod, mtsEst;
    public Departamento() {
    }
    

    public float pagoContribuciones(float div, float mV, float mtsBod,float mtsEst){    	
    	return super.pagoContribuciones(div) + ((mV + mtsBod + mtsEst) * 400 );
    }
    
    float gastosComunes(float mV, float mtsBod,float mtsEst){
    	return 	(mV + mtsBod + mtsEst)*1000;
    }
    
	public String informacionViv(){
		return "Metros Bodega : " + mtsBod + " Metros Estacionamiento : " +mtsEst;
	}
}