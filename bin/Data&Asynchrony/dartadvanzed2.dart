import 'dart:io';
import 'dart:async';
import 'dart:convert';

void initializeLogFile() {
  try{
  final directory = Directory('storage');
  if (!directory.existsSync()) {
    directory.createSync();
  }
  final file = File('${directory.path}/data.txt');
  file.writeAsStringSync('User activity log initialized');

  } catch(e) {
    print('Error: Could not create file');
  }
  
}
void appendLogEntry() async{
  try {
    final file = File('storage/data.txt');
    final timestamp = DateTime.now().toIso8601String();
    file.writeAsStringSync('\n$timestamp', mode: FileMode.append);
  } catch (e) {
    print('Error: File not found');
  }
}
Future<Object> readLogFile() async{
  try{
    final file = File('storage/data.txt');
    final lines = await file.readAsLines(encoding: utf8);
    return lines;
  } catch (e) {
    return "Error: Could not read file";
  }
  
}

Future<Object> listStorageFiles() async {
  try{
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
  } catch (e) { 
    return "Error: Could not list files";
  }
}

bool deleteLogFileIfExists(){
  try{
    final file = File('storage/data.txt');
    file.deleteSync();
    return true;
  } catch (e) {
    return false;
  }
}
void main() async{
  initializeLogFile();
  //appendLogEntry();
  final logs = await readLogFile();
  print(logs);
  print(await listStorageFiles());
  print(deleteLogFileIfExists());
}
