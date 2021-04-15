# include <stdio.h>
# include <stdlib.h>
# include <iostream>

using namespace std;

class proce{
	public:
		void setN1(int val);
		void setN2(int val);
		int multiplicar();
		int multiplicar2(int val);
	private:
		int N1,N2;
};

void proce::setN1(int val){
	N1 = val;
}

void proce::setN2(int val){
	N2 = val;
}

int proce::multiplicar(){
	return N1 * N2;
}

int proce::multiplicar2(int val){
	return val * (N1 * N2);
}

int main(){
	proce aca;
	system("cls");
	int a,b,c,d;
	printf("Ingresa numero 1: ");
	scanf("%d/n", &a);
	aca.setN1(a);
	printf("Ingresa numero 2: ");
	cin >> b;
	aca.setN2(b);
	c = aca.multiplicar();
	d = aca.multiplicar2(c);
	cout << a << "   " << b << "   " << c << "   " << d << endl;
	aca.setN1(5);
	c = aca.multiplicar();
	d = aca.multiplicar2(c);
	cout << a << "   " << b << "   " << c << "   " << d << endl;
	printf("%d   %d   %d   %d",a,b,c,d);
}
