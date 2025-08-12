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
}