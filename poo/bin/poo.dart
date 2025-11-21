import 'package:poo/poo.dart' as poo;

void main(List<String> arguments) {
  final person = Person("Tabis", 35);
  person.greet();

  final triangulo = new Triangulo();
  triangulo.base = 5;
  triangulo.altura = 10;
  print(triangulo);
  print('El area es: ${triangulo.area}');  
}

class Person {
  // Inicializar atributos
  String name;
  int age;

  //Consructor
  Person(this.name, this.age);

  //Metodo
  void greet(){
    print("Hello, my name is $name and I'm $age years old.");
  }

}

class Triangulo{
  double _base = 0;
  double _altura = 0;

  set base(double valorBase){
    if(valorBase <= 0){
      throw("El valor de la base no puede ser menor o igual a 0");
    } else{
      this._base = valorBase;
    }
  }

  set altura(double valorAltura){
    if(valorAltura <= 0){
      throw("El valor de la altura no puede ser menor o igual a 0");
    } else{
      this._altura = valorAltura;
    }
  }

  double get area {
    return _base * _altura / 2;
  }

  toString() => 'Base : $_base ; Altura: $_altura';
}
