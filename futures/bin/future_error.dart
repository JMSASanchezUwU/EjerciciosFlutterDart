void main(){
  //Future que lanza una excepcion
  Future((){
    throw Exception("Algo salio mal!");
  }).then((_){print('Operacion exitosa!');}).catchError((e){print("Error: $e");});
  
}