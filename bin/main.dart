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

  final light1 = Light();
  final thermostat1 = Thermostat();
  final alarm1 = Alarm();

  // encender algunos, dejar otros apagados
  light1.turnOn();
  thermostat1.turnOn();
  thermostat1.setTemperature = 22; // setTemperature

  // disparar comportamiento específico del Alarm
  final msg = alarm.triggerAlarm(); // puede ser null

  // reporte final (una línea por dispositivo)
  print('Smart Light: ${light.isOn ? 'ON' : 'OFF'}');
  print('Thermostat: ${thermostat1.isOn ? 'ON' : 'OFF'}, '
        '${thermostat1.getTemperature}°C, '
        'EcoMode: ${thermostat1.isEcoMode}');
  print('Alarm: ${alarm.isOn ? 'ON' : 'OFF'}'
        '${msg != null ? ' — $msg' : ''}');
}