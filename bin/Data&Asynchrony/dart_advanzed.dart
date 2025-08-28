import 'dart:io';
import 'dart:async';
import 'dart:convert';

void initializeLogFile() {
  final directory = Directory('storage');
  if (!directory.existsSync()) {
    directory.createSync();
  }
  final file = File('${directory.path}/data.txt');
  file.writeAsStringSync('User activity log initialized');
}
void appendLogEntry(){
  final file = File('storage/data.txt');
  final timestamp = DateTime.now().toIso8601String();

  file.writeAsStringSync('\n$timestamp', mode: FileMode.append);
}
Future<List<String>> readLogFile() async{
  final file = File('storage/data.txt');
  final lines = await file.readAsLines(encoding: utf8);

  return lines;
}

Future<List<String>> listStorageFiles() async {
  final dir = Directory('storage');
  
  // Verificamos si el directorio existe
  if (!await dir.exists()) {
    return [];
  }

  // Listamos solo los archivos, no subdirectorios
  final files = await dir
      .list()
      .where((entity) => entity is File)
      .map((entity) => entity.uri.pathSegments.last)
      .toList();

  return files;
}

void main() async{
  //initializeLogFile();
  //appendLogEntry();
  final logs = await readLogFile();
  print(logs);
  print(await listStorageFiles());
}
