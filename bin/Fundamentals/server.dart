import 'dart:io';
import 'package:intl/intl.dart';
import 'package:characters/characters.dart';

void printEachCharacter(String text) {
  for (var character in text.characters) {
    print(character);
  }
}

String greetingMessage(String name){
  int hour = DateTime.now().hour;
  if (hour >= 5 && hour <= 11) {
    return "Good morning, $name!";
  } else if (hour >= 12 && hour <= 17) {
    return "Good afternoon, $name!";
  } else {
    return "Good evening, $name!";
  }
}

void countVisibleCharacters(String text) {
  int count = text.characters.length;
  print('Visible characters: $count');
}

void formatToday() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE, MMMM d, y').format(now);
  print(formattedDate);
}

var message = 'Global';
void main() {
  print('Hello, World!');
  
  var age = 25;
  var height = 1.75;
  var isStudent = true;
  var name = 'Alex';
  print('$name  is $age years old, $height meters tall, and a student: $isStudent.');
  
  final  currentYear  = 2025;
  const  pi = 3.14159;
  print('currentYear: $currentYear');
  print('pi: $pi');
  //  currentYear = 2026;

  var myVar = 42;
  int myInt = 42;
  print('The type of myVar is: ${myVar.runtimeType}');
  print('The type of myInt is: ${myInt.runtimeType}');

  String? nickname;
  nickname = 'Lex';
  if (nickname != null){
    print('Nickname is: $nickname');
  }

  int a = 10;
  int b = 3;
  print('a + b = ${a + b}');
  print('a - b = ${a - b}');
  print('a * b = ${a * b}');
  print('a / b = ${a / b}');
  print('a > b = ${a > b}');
  print('a == b = ${a == b}');
  print('a > 5 && b < 5 = ${a > 5 && b < 5}');
  print('a > 5 || b < 5 = ${a > 5 || b < 5}');

  var temperature = 35;
  print('Temperature: $temperature');
  if(temperature >= 30){
    print('Warning: Hot weather!');
  }else{
    print('Weather is normal.');
  }

  int score = 82;
  if(score >= 90 && score <= 100){
    print('Grade: A');
  }else if(score >= 80 && score <= 89){
    print('Grade: B');
  }else if (score >= 70 && score <= 79){
    print('Grade: C');
  }else if (score < 70){
    print('Grade: D');
  }

  int dayNumber = 5;
  print('Day number: $dayNumber'); 
  switch (dayNumber) {
    case 1:
      print('Weekday: Monday');
      break;
    case 2:
      print('Weekday: Tuesday');
      break;
    case 3:
      print('Weekday: Wednesday');
      break;
    case 4:
      print('Weekday: Thursday');
      break;
    case 5:
      print('Weekday: Friday');
      break;
    case 6:
      print('Weekday: Saturday');
      break;
    case 7:
      print('Weekday: Sunday');
      break;
    default:
      print('Weekday: Invalid day number');
  }

  for(var i = 1; i <= 10; i++){
    if ((i % 2) == 0)
    print('$i');
  }

  int start = 5;
  while(start >= 0){
    if(start > 0){
      print('$start');
    }else if(start == 0){
      print('Blast off!');
    }
    start--;
  }

  for(int j = 1; j <= 10; j++){
    if(j % 4 == 0){
      continue;
    }
    print('$j');
  }

  for(int j = 1; j <= 10; j++){
    if(j > 6){
      break;
    }
    print('$j');
  }

  var shoppingList = ['milk', 'bread', 'eggs'];
  shoppingList.add('cheese');
  shoppingList.add('butter');
  shoppingList.remove('bread');
  print('$shoppingList');

  var capitals = {'France':'Paris', 'Japan':'Tokyo', 'Brazil':'Brasilia'};
  capitals["Canada"] = "Ottawa";
  print(capitals["Japan"]);
  for (var entry in capitals.entries) {
    print('${entry.key}: ${entry.value}');
  }

  var numbers = Set.from([1, 2, 2, 3, 4, 4, 5]);
  print('$numbers');
  
  for (var item in shoppingList){
    print(item);
  }

  var scores = [85, 42, 90, 67, 58];
  var uppers = (scores.where((n) => n >= 60)).toList();
  print(uppers);

  var cities = ["london", "madrid", "rome"];
  var upperCities = (cities.map((city) => city.toUpperCase())).toList();
  print(upperCities);

  List<int> unsorted = [9, 2, 7, 4, 1];
  unsorted.sort();
  print(unsorted);

  void sayHello(){    
    print('Hello, Dart!');
  }
  sayHello();

  void greet(String name){
    print('Hello, $name!');
  }
  greet('Sam');

  String getFullName(String first, String last){
    return 'Full name: $first $last';
  }
  print(getFullName('Ada', 'LoveLace'));

  double toCelsius(double fahrenheit){
    return (fahrenheit - 32) * 5/9;
  }
  double result = toCelsius(98.6);
  print("Celsius: ${result.toStringAsFixed(1)}");

  void printMultiples(int number, [int? max = 5]){
    for(int i = 1; i <= max!; i++){
      stdout.write('${number * i} ');
    }
    print('');
  }
  printMultiples(3);
  printMultiples(4, 3);

  int square(int x) => x * x;
  print(square(6));

  var numbers2 = [1, 2, 3, 4];
  numbers2.forEach((n) {
    print(n * n);
  });

  printMessage(){
    var message = 'Local';
    print('$message');
  }
  printMessage();
  print(message);

  formatToday();
  countVisibleCharacters("👨‍👩‍👧‍👦 family");
  print(greetingMessage("Ada"));
  printEachCharacter("Dart 🚀");
}
