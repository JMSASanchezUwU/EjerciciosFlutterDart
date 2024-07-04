class Animal{
  String _nombre = "Sin nombre";
  int _edad = 0;

  // Animal(){
  //   print("Constructor fue llamado");
  // }

  Animal({String nombre = "Anonimo", int edad = 0}){
    print("Contructor llamado");
    _edad = edad;
    _nombre = nombre;
  }

  void comer(){
    print("Comiendo");
  }

  void cambiarEstado(String nombre, int edad){
    _nombre = nombre;
    _edad = edad;
  }

  void imprimir(){
      print("Animal: $_nombre, Edad: $_edad");
  }
}

void main(){
  var a = Animal();
  print(a._nombre);
  print(a._edad);

  a._nombre = "Jaguar";
  a._edad = 10;

  print("Animal: ${a._nombre}, Edad: ${a._edad}");

  a.comer();

  print(a is Animal);

  a.cambiarEstado("Gato", 0);

  a.imprimir();

  var a2 = Animal();

  var a3 = Animal(nombre:"Pantrera", edad: 3);
  a3.imprimir();
}