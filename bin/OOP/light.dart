import 'smart_device.dart';

class Light extends SmartDevice{
  void turnOn(){
    isOn = true;
    print('Light turned on.');
  }
  void turnOff(){
    isOn = false;
    print('Light turned off.');
  }
}