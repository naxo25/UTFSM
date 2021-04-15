class ejercicios{
	public static void main (String arg[]){
		int elementos[]={8,5,4,7,9,1,6};
		for (int i=0;i<elementos.length;i++){
			for (int j=0;j<elementos.length;j++){
				if (elementos[i]<elementos[j]){
					int auxnumero = elementos[i];
					elementos[i]=elementos[j];
					elementos[j]=auxnumero;
	}}}
		for (int i=0;i<elementos.length;i++){
			System.out.println(elementos[i]);
		}
	}
}