public class Casa extends Vivienda {
	public
		float cuotaAseo;
    public Casa(float cA) {
    	cuotaAseo=cA;
    }

    public String informacionViv(){
		return "Couta Aseo : " + cuotaAseo;
	}

}