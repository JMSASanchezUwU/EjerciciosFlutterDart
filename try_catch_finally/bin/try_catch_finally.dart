void main(){
  try{
  int resultadio = 10 ~/ 0;
  print("La division es $resultadio");
  }on Exception{
    print("Se produjo la excepcion de divison entre cero");
  }finally{
    print("No olvides limpiar tus objetos");
  }

  try{
    List<int> lista = [1,2,3];
    print(lista[4]);
  }on RangeError{
    print("Indice fuera del rango");
  }catch(e){
    print("Hubo una excepcion $e");
  }finally{
    print("Operacion completada!");
  }
}
