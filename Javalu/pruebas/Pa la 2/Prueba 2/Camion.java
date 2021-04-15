public class Camion extends Vehiculos {
	
	int CapacidadCarga;
	float ImpuestoCarga;
	
	public Camion (int C) {
		CapacidadCarga = C;
	}
	
	public float CalcularImpuesto () {
		ImpuestoCarga = (float)0.1 * CapacidadCarga;
		return ImpuestoCarga;
	}
	
	public String mostrarDatos () {
		return "\nCapacidad de Carga: " + CapacidadCarga + "\nImpuesto de Carga: " + ImpuestoCarga;
	}
	
}