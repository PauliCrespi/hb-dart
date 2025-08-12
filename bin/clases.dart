import 'dart:io';
import 'package:intl/intl.dart';
import 'package:characters/characters.dart';

class Animal{
  var name;
  void speak(){
    print('Some sound');
  }
}
class Person{
  var name;
  var age;
  void introduce(){
    print("Hi, I'm $name and I'm $age years old.");
  }
}
void main() {
  Animal a = Animal();
  a.name = 'Generic';
  a.speak();
  
  Person person = Person();
  person.name = 'Alice';
  person.age = 30;
  person.introduce();
}