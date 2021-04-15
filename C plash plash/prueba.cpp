#include <stdio.h>
#include <stdlib.h>
// Aquí van las declaraciones de las clases.
class Medios_Transporte{
	protected:
 		int Cantidad_Ocupantes, Capacidad_Carga;
	public:
		void SetCapacidad(int Capacidad);
};


void Medios_Transporte::SetCapacidad(int Capacidad){
Capacidad_Carga = Capacidad;
}


class Terrestre : public Medios_Transporte{
	protected:
		int Cantidad_Ruedas, Kilometros_Recorridos, CantidadCombustible;
	public:
		Terrestre();
		void Aumentar_Kilometraje_En(int Kilometros);
		int GetKilometraje();
		void CargarCombustible(int Cantidad);
};

int Terrestre::GetKilometraje(){
return Kilometros_Recorridos;
}

void Terrestre::Aumentar_Kilometraje_En(int Kilometros){
if (Kilometros > 0)
Kilometros_Recorridos += Kilometros;
}

Terrestre::Terrestre(){
Kilometros_Recorridos = 0;
}

void Terrestre::CargarCombustible(int Cantidad){
CantidadCombustible += Cantidad;
}

class Colectivo : public Terrestre{
protected:
char Tiene_Restriccion;
public:
void Aplicar_Restriccion_Vehicular(char estado);
};



void Colectivo::Aplicar_Restriccion_Vehicular(char estado){
if(estado == 'S' || estado == 's')
Tiene_Restriccion = 'S';
if(estado == 'N' || estado == 'n')
Tiene_Restriccion = 'N';
}


class Particular : public Terrestre{
};


class Bus : public Colectivo{
private:
int Valor_Pasaje_Estudiante;
public:
int Obtener_Valor_Pasaje();
};


int Bus::Obtener_Valor_Pasaje(){
return Valor_Pasaje_Estudiante;
}


class Automovil : public Colectivo{
};


class Maritimos : public Medios_Transporte{
protected:
float Eslora;
};



class Privado : public Maritimos{
};


class Comercial : public Maritimos{
};


class Militar : public Maritimos{
private:
int Numero_de_Canones;
};


class Artesanal : public Comercial{
};


class Industrial : public Comercial{
};


int main(void) {
	system("CLS");
	Particular MiMoto;
	Bus MiBus; Artesanal MiBote;
	MiMoto.Aumentar_Kilometraje_En(5);
	printf("Klms: %d\n", MiMoto.GetKilometraje());
	MiBus.CargarCombustible(20);
	MiBote.SetCapacidad(150);
	system("PAUSE");
}
