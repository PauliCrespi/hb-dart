import '../OOP/smart_device.dart';

class Alarm extends SmartDevice{
  void turnOn(){
    isOn = true;
    print('Alarm turned on.');
  }
  void turnOff(){
    isOn = false;
    print('Alarm turned off.');
  }
  String? triggerAlarm() {
    if (!isOn) {
      return 'Triggering emergency signal!';
    }else{
      return null;
    }
  }
}