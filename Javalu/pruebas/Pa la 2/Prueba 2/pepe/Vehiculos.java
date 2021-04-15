
class Vehiculos{
	private int ruedas;
	private int puertas;
	private String placa;
	private String marca;
	private int combustible;
	
	public Vehiculos(){
		
	}
	public Vehiculos(int ru, int pu, String pla, String mar, int com){
		ruedas=ru;
		puertas=pu;
		placa=pla;
		marca=mar;
		combustible=com;
	}
	
	public void setRuedas(int ru){
		ruedas=ru;
	}
	public int getRuedas(){
		return ruedas;
	}
	
	public void setPuertas(int pu){
		puertas=pu;
	}
	public int getPuertas(){
		return puertas;
	}
	
	public void setPlaca(String pla){
		placa=pla;
	}
	public String getPlaca(){
		return placa;
	}
	
	public void setMarca(String mar){
		marca=mar;
	}
	public String getMarca(){
		return marca;
	}
	
	public void setCombustible(int com){
		combustible=com;
	}
	public int getCombustible(){
		return combustible;
	}
	
	public float calcularPrecioC(float valorC){
		float pago=0;
		pago = combustible*valorC;
		return pago;
	}
	
	public String mostrarDatos(){
		return "\n"+"~Datos Vehiculo~"+"\n"+"Ruedas: "+ruedas+"\n"+"Puertas: "+puertas+"\n"+"Placa: "+placa+"\n"+"Marca: "+marca+"\n"+"Combustible: "+combustible+"\n";
		
	}
}