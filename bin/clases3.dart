class BankAccount{
  double _balance = 0;
  deposit(double amount){
    _balance += amount;
  }
  double get balance{
    return _balance;
  }
  
  set balance(double value){
    if (value > 0){
      _balance = value;
    }
  }
  
  String get status {
    if (_balance == 0) {
      return "Empty";
    } else if (_balance < 100) {
      return "Low";
    } else {
      return "Healthy";
    }
  }

  getBalance(){
    print('Current balance: $_balance');
  }

}

abstract class Device{
  turnOn();
}

class Printer extends Device{
  turnOn(){
    print('Printer is now ON.');
  }
}
class Monitor extends Device{
  turnOn(){
    print('Monitor is now ON.');
  }
}

class User{
  Map<String, dynamic> _data = {};
  setName(String name){
    _data['name'] = name;
  }
  getName(){
    if (_data['name'] == null) return 'Name not set';
    return _data['name'];
  }
}
void main() {
  BankAccount account = BankAccount();
  account.deposit(150.0);
  account.getBalance();

  BankAccount a = BankAccount();
  a.balance = 250.0;
  print('Balance: ${a.balance}');
  print('Status: ${a.status}');

  Device printer = Printer();
  Device monitor = Monitor();

  printer.turnOn();
  monitor.turnOn();

  User user = User();
  print(user.getName()); // Before setting
  user.setName('Alice');
  print(user.getName());
}