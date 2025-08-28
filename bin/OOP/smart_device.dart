abstract class SmartDevice{
  bool _isOn = false;

  void turnOn();
  void turnOff();

  bool get isOn => _isOn;
  set isOn(bool value) {
    _isOn = value;
  }

  printStatus(){
    if (_isOn){
      print('Current status: ON');
    } else {
      print('Current status: OFF');
    }
  }
}


