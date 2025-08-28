import 'smart_device.dart';

class Thermostat extends SmartDevice{
  int _temperature = 20;

  int get getTemperature{
    return _temperature; 
  }
  set setTemperature(int value){
    _temperature = value;
    print('Thermostat set to ${_temperature}°C.');
  }

  void turnOn(){
    isOn = true;
    print('Thermostat turned on.');
  }
  void turnOff(){
    isOn = false;
    print('Thermostat turned off.');
  }
  
  bool get isEcoMode => _temperature < 20;
  void increaseTemp(int amount){
    _temperature += amount;
  }
}