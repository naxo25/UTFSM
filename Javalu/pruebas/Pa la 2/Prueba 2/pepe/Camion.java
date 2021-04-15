
class Camion extends Vehiculos{
	private int capacidadCarga;
	private double impuestosCarga;
	
	public Camion(int rue, int puer, String pla, String mar, int com, int capC, double impC){
		setRuedas(rue);
		setPuertas(puer);
		setPlaca(pla);
		setMarca(mar);
		setCombustible(com);
		capacidadCarga=capC;
		impuestosCarga=impC;
	}
	
	public void setCapacidadC(int capC){
		capacidadCarga=capC;
	}
	public int getCapacidadC(){
		return capacidadCarga;
	}
	
	public void setImpuestosC(double impC){
		impuestosCarga=impC;
	}
	public double getImpuestosC(){
		return impuestosCarga;
	}
	
	public double calcularImpuestos(){
		double impuesto=capacidadCarga*0.1;
		return impuesto;
	}
}