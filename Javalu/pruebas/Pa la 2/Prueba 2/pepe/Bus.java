
class Bus extends Vehiculos{
	private int pasajeros;
	private int tipoP;
	
	public Bus(){
		
	}
	
	public int valorPago(){
		int vP=0;
		
		if (tipoP == 1){
			vP=500;
		}
		if (tipoP == 2){
			vP=750;
		}
		return vP;
	}
	
	public void setPasajeros(int pas){
		pasajeros=pas;
	}
	public int getPasajeros(){
		return pasajeros;
	}
	
	public void setTipoP(int tipo){
		//Validacion tipo
		if (tipo==1 || tipo==2){
			tipoP=tipo;
		}else{
			System.out.print("\nError al ingresar tipo pasajero!!\n");
		}
		
	}
	public int getTipoP(){
		return tipoP;
	}
	
	public String mostrarDatos(){
		int ru=getRuedas();
		int puer=getPuertas();
		String pla=getPlaca();
		String mar=getMarca();
		int com=getCombustible();
		return "\n"+"~Datos Vehiculo~"+"\n"+"Ruedas: "+ru+"\n"+"Puertas: "+puer+"\n"+"Placa: "+pla+"\n"+"Marca: "+mar+"\n"+"Combustible: "+com+"\n"+"Pasajero: "+pasajeros+"\n"+"Tipo pasajero: "+tipoP+"\n";
		
	}
}