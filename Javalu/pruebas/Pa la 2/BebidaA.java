public class BebidaA extends Bebida{
	Byte Grados, Anio;
	
	public BebidaA(){
	}
	
	public BebidaA(Byte gr, Byte an){
		Grados = gr;
		Anio = an;
	}
	
	public String CalcularP(int Precio){
		double porc = 0;
		if(Anio >= 2 && Anio <= 4) porc = 0.1;
		if(Anio >= 5 && Anio <= 9) porc = 0.2;
		if(Anio >= 10) porc = 0.3;
		Precio += (porc * Precio);
		return "\nPrecio Final : " + Precio;
	}
	
	public String datos(){
		return "\nGrados : " + Grados + "\nAnio : " + Anio;
	}
	
}