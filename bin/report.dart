import 'dart:io';
import 'package:intl/intl.dart';
import 'package:characters/characters.dart';

String greetingMessage(String name){
  int hour = DateTime.now().hour;
  if (hour >= 5 && hour <= 11) {
    return "Good morning, $name!";
  } else if (hour >= 12 && hour <= 17) {
    return "Good afternoon, $name!";
  } else {
    return "Good evening, $name!";
  }
}

void formatToday() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE, MMMM d, y').format(now);
  print(formattedDate);
}

void countVisibleCharacters(String text) {
  int count = text.characters.length;
  print('Title has: $count characters.');
}

// Parsea una tarea "Nombre:true/false" -> {'name': String, 'done': bool}
Map<String, Object>? parseTask(String raw) {
  final idx = raw.lastIndexOf(':'); // permite ":" dentro del nombre
  final name = raw.substring(0, idx).trim();
  final status = raw.substring(idx + 1).trim().toLowerCase();

  if (status == 'true')  return {'name': name, 'done': true};
  if (status == 'false') return {'name': name, 'done': false};
}

// Parsea todas las tareas (salta inválidas)
List<Map<String, Object>> parseTasks(List<String> raws) {
  final out = <Map<String, Object>>[];
  for (final r in raws) {
    final t = parseTask(r);
    if (t != null) out.add(t);
  }
  return out;
}
void printTasks(List<Map<String, Object>> tasks) {
  if (tasks.isEmpty) {
    print('(No tasks provided)');
    return;
  }
  for (final t in tasks) {
    final done = t['done'] as bool;
    final name = t['name'] as String;
    final mark = done ? '✅' : '❌';
    print('$mark $name');
  }
}

void printSummary(List<Map<String, Object>> tasks) {
  final doneCount = tasks.where((t) => t['done'] == true).length;
  final total = tasks.length;
  print('\nYou completed $doneCount out of $total tasks.');
}

void main(List<String> arguments) {
  // arguments is a List<String> from the CLI
  final name = arguments[0];
  final title = arguments[1];
  final tasks = parseTasks(arguments.skip(2).toList());

  print(greetingMessage(name));
  formatToday();
  print('');
  print(title);
  countVisibleCharacters(title);
  print('');
  
  printTasks(tasks);
  printSummary(tasks);
}
