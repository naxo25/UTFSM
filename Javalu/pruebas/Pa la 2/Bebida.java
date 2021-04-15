public class Bebida{
	String Sabor, Marca, Nombre;
	short Cap;
	int Precio;

	public Bebida(){
	}
	
	public Bebida(String S, String M, String N, short C, int P){
		Sabor = S;
		Marca = M;
		Nombre = N;
		Cap = C;
		Precio = P;
	}
	
	public String datos(){
		return "Sabor : " + Sabor + "\nMarca : " + Marca + "\nNombre : " + Nombre + "\nCapacidad : " + Cap + "\nPrecio Original : " + Precio;
	}
	
}