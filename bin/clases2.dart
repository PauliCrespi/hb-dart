

class Shape{
  draw(){
    print('Drawing a shape');
  }
}
class Circle extends Shape{
  draw(){
    print('Drawing a circle');
  }
}
class Square extends Shape{
  draw(){
    print('Drawing a square');
  }
}
abstract class Animal{
  makeSound();
  sleep(){
    print('Sleeping...');
  }
}
class Cat extends Animal{
  makeSound(){
    print('Meow!');
  }
}
class Dog extends Animal{
  makeSound(){
    print('Woof!');
  }
}
abstract class Flyable{
  fly();
}
class Bird implements Flyable{
  fly(){
    print('Bird is flying');
  }
}
class Plane implements Flyable{
  fly(){
    print('Plane is flying');
  }
}

void main() {


  Shape s = Shape();
  Circle c = Circle();
  Square sq = Square();

  s.draw();
  c.draw();
  sq.draw();

  Dog d = Dog();
  Cat ca = Cat();

  d.makeSound();
  d.sleep();
  ca.makeSound();
  ca.sleep();

  Flyable f1 = Bird();
  Flyable f2 = Plane();

  f1.fly();
  f2.fly();

  List<Animal> pets = [Dog(), Cat()];

  for (var pet in pets) {
    print(pet.runtimeType);
    pet.makeSound();
    if (pet is Dog) {
      print("It's a dog");
    }
  }
}