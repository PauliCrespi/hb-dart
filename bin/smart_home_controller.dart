// smart_home_controller.dart
import 'dart:io';
import 'smart_device.dart';

class SmartHomeController {
  final List<SmartDevice> _devices = [];

  void addDevice(SmartDevice device) => _devices.add(device);

  void runDiagnostics() {
    for (final d in _devices) {
      final type = d.runtimeType;  
      stdout.write('[$type] ');
      d.printStatus();
    }
  }
}
