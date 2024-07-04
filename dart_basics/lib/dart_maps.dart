void main(){
   Map<String, int> notas = {'ddi': 10, 'bd':8, 'iot':7, 'in':10};
   print(notas);

   //Imprimir calificacion de db
   print(notas['bd']);
   notas['bd'] = 10;
   print(notas);

  for (var nota in notas.keys){
    print("$nota : ${notas[nota]}");
  }

  notas.forEach((key,value)=> print('$key: $value'));
}