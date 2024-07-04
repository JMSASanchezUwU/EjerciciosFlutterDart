//Archivo stream_async_await.dart
void main()async{
    Stream<int> stream = Stream.periodic(
    Duration(seconds: 1),(contador)=>contador).take(10);
  await for(var data in stream){
    print("Dato recibido: $data");
  }
  print("Fin del Stream");
}