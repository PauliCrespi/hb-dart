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

class Book{
  var title;
  var author;
  Book(this.title, this.author);
  Book.untitled(){
    title = 'Untitled';
    author = 'Unknown';
  }
}

class Timer{
  int seconds;
  Timer({required this.seconds});
  void start(){
    print('Timer started for ${seconds} seconds.');
  }
}

class Vehicle{
  String type = 'Generic Vehicle';
  describe(){
    print('This is a $type.');
  }
}
class Car extends Vehicle{
  int wheels = 4;
}

class Employee{
  String name;
  int id;
  Employee(this.name, this.id);
}

class Manager extends Employee{
  String department;
  Manager(String name, int id, this.department) : super(name, id);
}

class Animales{
  void makeSound(){
    print('Some generic animal sound');
  }
}
class Dog extends Animales{
  void makeSound(){
    super.makeSound();
    print('Woof!');
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

  var custom = Book('1984', 'George Orwell');
  var defaultBook = Book.untitled();
  print('${custom.title}, by ${custom.author}');
  print('${defaultBook.title}, by ${defaultBook.author}');

  Timer t = Timer(seconds: 10);
  t.start();

  Car myCar = Car();
  print(myCar.type);
  print(myCar.wheels);
  myCar.describe();

  Car c = Car();
  print('Inherited property: ${c.type}');
  print('Calling inherited method:');
  c.describe();

  Manager mgr = Manager('Alice', 1001, 'HR');
  print('${mgr.name}, ID: ${mgr.id}, Dept: ${mgr.department}');

  Dog myDog = Dog();
  myDog.makeSound();
}