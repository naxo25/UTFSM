class Persona{
	
	private String rut;
	private String nombre;
	private byte edad;
	private char sexo;
	private String direc;
	
	public Persona(){
		
	}
	
	public Persona(String rut, String nombre, byte edad, char sexo, String direc){
		this.rut=rut;
		this.nombre=nombre;
		this.edad=edad;
		this.sexo=sexo;
		this.direc=direc;
	}
	
	
	public String getRut(){
		return rut;
	}
	public void setRut(String r){
		rut= r;
		
	}
	
	public String getNombre(){
		return nombre;
	}
	public void setNombre(String n){
		nombre= n;
		
	}
	
	public byte getEdad(){
		return edad;
	}
	public void setEdad(byte e){
		edad= e;
		
	}
	public char getSexo(){
		return sexo;
	}
	public void setSexo(char s){
		sexo= s;
		
	}
	
	public String getDirec(){
		return direc;
	}
	public void setDirec(String d){
		direc= d;
		
	}
}