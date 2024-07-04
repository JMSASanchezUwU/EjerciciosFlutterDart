import 'figura.dart';
//Crear la funcion main
void main(){
  var circulo = Circulo(8);
  print("El area del circulo con radio: ${circulo.radio}} es: ${circulo.calcularArea()} ");

  var rectangulo = Rectangulo(10, 50);
  print("El area del rectangulo con base ${rectangulo.base} y altura ${rectangulo.altura} es: ${rectangulo.calcularArea()}");
  
}