class OperacionesAritmeticas{
  //metodo sumar
  public static double sumar(double x,double y){
  	double resul=0;
	resul=x+y;
	return resul;
  }
  public static void main(String arg[]){
	double num1=10, num2=20,r=0;
	r=sumar(num1,num2);
	System.out.println("suma= " + r);
  }
}