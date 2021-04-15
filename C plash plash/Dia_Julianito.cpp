#include <iostream>
#include <stdlib.h>
#include <stdio.h>

using namespace std;

bool esBisiesto(int AnnoBis);

class Fecha{
	public:
		string GetDiaSemana(string Dia);
		string GetNomMes(string Mes);
		string GetDia();
		string GetMes();
		string GetAnno();
		int GetJuliano();
		void ReadFecha();
		string GetFecha();
	private:
		char Dia[3] = "", Mes[3] = "", Anno[6] = "";
		char Fecha[12];
};

/*string Fecha::GetDiaSemana(string Dia){
	int n;
	n = atoi(Dia);
	if(n/2 % 0){
		return "Martes";
	}else{
	if(n/3 % 0){
		return "Miercoles";
	}else{
	if(n/4 % 0){
		return "Jueves";
	}else{
	if(n/5 % 0){
		return "Viernes";
	}else{
	if(n/6 % 0){
		return "Sabado";
	}else{
	if(n/7 % 0){
		return "Domingo";
	}else{
		return "Lunes";
	}}}}}}	
}*/

string Fecha::GetNomMes(string Mes){
	
	if (Mes[0]=='0' and Mes[1]=='1'){
		return "Enero";
	}
	if (Mes[0]=='0' and Mes[1]=='2'){
		return "Febrero";
	}
	if (Mes[0]=='0' and Mes[1]=='3'){
		return "Marzo";
	}
	if (Mes[0]=='0' and Mes[1]=='4'){
		return "Abril";
	}
	if (Mes[0]=='0' and Mes[1]=='5'){
		return "Mayo";
	}
	if (Mes[0]=='0' and Mes[1]=='6'){
		return "Junio";
	}
	if (Mes[0]=='0' and Mes[1]=='7'){
		return "Julio";
	}
	if (Mes[0]=='0' and Mes[1]=='8'){
		return "Agosto";
	}
	if (Mes[0]=='0' and Mes[1]=='9'){
		return "Septiembre";
	}
	if (Mes[0]=='1' and Mes[1]=='0'){
		return "Octubre";
	}
	if (Mes[0]=='1' and Mes[1]=='1'){
		return "Noviembre";
	}
	if (Mes[0]=='1' and Mes[1]=='2'){
		return "Diciembre";
	}
}

string Fecha::GetDia(){
	return Dia;
}

string Fecha::GetMes(){
	return Mes;
}

string Fecha::GetAnno(){
	return Anno;
}

int Fecha::GetJuliano(){
	char FBaseJ[]="01/01/-4713";
	char AnnoJ[5], MesJ[3], DiaJ[3];
	
	
	
}

string Fecha::GetFecha(){
	return Fecha;
}

void Fecha::ReadFecha(){
	short sw;
	int ValDia, ValMes, ValAnno;
	
	do{
		system("cls");       //0123456789
		printf("Ingrese Fecha (dd/mm/aaaa): ");
		cin.getline(Fecha,12);
		
	//Validar Ingreso de Fecha
		sw=0;
		if (Fecha[2]!='/' || Fecha[5]!='/'){
			sw=1;
		}
		Dia[0]=Fecha[0];
		Dia[1]=Fecha[1];
		
		Mes[0]=Fecha[3];
		Mes[1]=Fecha[4];
		
		Anno[0]=Fecha[6];
		Anno[1]=Fecha[7];
		Anno[2]=Fecha[8];
		Anno[3]=Fecha[9];
		Anno[4]=Fecha[10];
		
		ValDia = atoi(Dia);
		ValMes = atoi(Mes);
		ValAnno = atoi(Anno);
		
		//Validar Dia
		if (ValMes==1 || ValMes==3 || ValMes==5 || ValMes==7 || ValMes==8 || ValMes==10 || ValMes==12){
			if (ValDia>31){
				sw=1;
			}
		}
		if (ValMes==4 || ValMes==6 || ValMes==9 || ValMes==11){
			if (ValDia>30){
				sw=1;
			}
		}
		if (ValMes==2){
			if (ValDia>29){
				sw=1;
			}
		}
		
		//Validar Mes
		if (ValMes>12){
			sw=1;
		}
		
		
		if (sw==1)
			printf("ERROR! Ingreso una fecha erronea. \n");
		
		system("pause");
	}while(sw==1);
	
	cout<<Fecha<<endl;
	
	system("pause");
	
}

int main(){
	string Anno,Dia,NomMes,Mes,NomDia;
	
	Fecha FJuliano;
	FJuliano.ReadFecha();
	Dia=FJuliano.GetDia();
	Mes=FJuliano.GetMes();
 	NomMes=FJuliano.GetNomMes(Mes);
	Anno=FJuliano.GetAnno();
	cout << Dia << " de " << NomMes << " del " << Anno << endl;
	system("pause");
}

bool esBisiesto(int AnnoBis) 
{
     return ((AnnoBis % 4 == 0 && AnnoBis % 100 != 0) || AnnoBis % 400 == 0);
}
