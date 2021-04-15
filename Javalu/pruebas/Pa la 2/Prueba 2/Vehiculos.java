public class Vehiculos{
	
	int Ruedas, Puertas, Combustible;
	String Placa, Marca;
	
	/*public Vehiculos () {
	}
	
	public Vehiculos (int Ruedas, int Puertas, String Placa, String Marca, int Combustible) {
		this.Ruedas = Ruedas;
		this.Puertas = Puertas;
		this.Placa = Placa;
		this.Marca = Marca;
		this.Combustible = Combustible;
	}
	
	public int getRuedas () {
		return Ruedas;
	}
	
	public int getPuertas () {
		return Puertas;
	}
	
	public String getPlaca () {
		return Placa;
	}
	
	public String getMarca () {
		return Marca;
	}
	
	public int getCombustible () {
		return Combustible;
	}
	
	public void setRuedas (int R) {
		Ruedas = R;
	}
	
	public void setPuertas (int Pu) {
		Puertas = Pu;
	}
	
	public void setPlaca (String Pl) {
		Placa = Pl;
	}
	
	public void setMarca (String M) {
		Marca = M;
	}
	
	public void setCombustible (int C) {
		Combustible = C;
	}
	
	public float CalcularPrecioC (int ValorC) {
		
	}*/
	
	
	public Vehiculos () {
	}
	
	public Vehiculos (int R, int Pu, String Pl, String M, int C) {
	 	Ruedas = R;
	 	Puertas = Pu;
	 	Placa = Pl;
	 	Marca = M;
	 	Combustible = C;
	}
	
	public float CalcularPrecioC (int Precio) {
		return Combustible * Precio;
	}
	
	public String mostrarDatos() {
		return "\nRuedas: " + Ruedas + "\nPuertas: " + Puertas + "\nPlaca: " + Placa + "\nMarca: " + Marca + "\nCombustible: " + Combustible;
	}
	
}