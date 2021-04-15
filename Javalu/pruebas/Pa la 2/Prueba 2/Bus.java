public class Bus extends Vehiculos {
	
	int Pasajeros, TipoP;
	
	public Bus () {
	}
	
	public void setPasajeros (int P) {
		Pasajeros = P;
	}

	public void setTipoP (int T) {
		TipoP = T;
	}
	
	public int getPasajeros () {
		return Pasajeros;
	}
	
	public int getTipoP () {
		return TipoP;
	}
	
	public int ValorPago () {
		int var = 0;
		if (TipoP == 1) var = 500;
		if (TipoP == 2) var = 750;
		return var;
	}
	
	public String mostrarDatos () {
		return "Pasajeros: " + getPasajeros() + "\nTipo de pago: " + getTipoP() + "\nValor de pago: " + ValorPago();
	}
	
}