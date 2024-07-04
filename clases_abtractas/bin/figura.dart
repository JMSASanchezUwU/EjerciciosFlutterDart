//Crear una clase abstracta llamada figura
abstract class Figura{
    //Crear un metodo abstracto
    double calcularArea();

}

//Clase Rectangulo que hereda de figura
class Rectangulo extends Figura{
  //Atributos
  double base, altura;

  //Contructor
  Rectangulo(this.base, this.altura);

  @override
  double calcularArea() {
    return base * altura;
  }
}

//Crear Circulo que herede Figura
class Circulo extends Figura{
    //Atributos
  double radio;

  //Contructor
  Circulo(this.radio);

  //Metodos
  @override
  double calcularArea() {
   return 3.14 * radio * radio;
  }

}