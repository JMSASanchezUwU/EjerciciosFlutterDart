int suma(int n1, int n2){
  return n1 + n2;
}

double promedio (double c1, double c2, double c3){
  return (c1 + c2 + c3)/3;
}

void main(){
  int numero = 1000;
  int numero2 = 3000;
  int s = suma(numero, numero2);
  print('La luma de $numero mas $numero2 es \$ $s');

 double calificacion1 = 10.0, calificacion2 = 7.6, calificacion3 = 9.0;
 print(promedio(calificacion1, calificacion2, calificacion3));

 String miCrush = 'Fulana';

 print('$miCrush quiero contigo!');

 bool  isValid = true;

 print("Me quiere $miCrush? ${isValid?'Si':'No'}");
}