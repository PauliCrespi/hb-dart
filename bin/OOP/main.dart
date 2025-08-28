import 'light.dart';
import 'thermostat.dart';
import 'alarm.dart';
import 'smart_home_controller.dart';

void main() {
  Light light = Light();
  light.turnOn();
  light.printStatus();

  Thermostat thermostat = Thermostat();
  thermostat.setTemperature = 22;

  Alarm alarm = Alarm();
  if(alarm.triggerAlarm() != null){
    print("Alarm triggered! (because it was off)");
  }

  SmartHomeController controller = SmartHomeController();
  controller.addDevice(Light());
  controller.addDevice(Thermostat());
  controller.runDiagnostics();
  controller.addDevice(Alarm());

  final msg = alarm.triggerAlarm(); 

  // reporte final (una línea por dispositivo)
  print('Smart Light: ${light.isOn ? 'ON' : 'OFF'}');
  print('Thermostat: ${thermostat.isOn ? 'ON' : 'OFF'}, '
        '${thermostat.getTemperature}°C, '
        'EcoMode: ${thermostat.isEcoMode}');
  print('Alarm: ${alarm.isOn ? 'ON' : 'OFF'}'
        '${msg != null ? ' — $msg' : ''}');
}