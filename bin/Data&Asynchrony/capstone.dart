import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String filePath = 'storage/notes.json';

class Note {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'createdAt': createdAt.toIso8601String(),
      };

  @override
  String toString() =>
      '[$id] $title | ${createdAt.toLocal().toIso8601String()}';
}


Future<void> saveNotes(List<Note> notes) async {
  try {
    final file = File(filePath);
    await file.create(recursive: true); // crea storage/ si no existe
    final jsonStr = jsonEncode(notes.map((n) => n.toJson()).toList());
    await file.writeAsString(jsonStr);
  } catch (e) {
    stderr.writeln('Error saving notes: $e');
  }
}

Future<List<Note>> loadNotes() async {
  try {
    final file = File(filePath);
    if (!await file.exists()) return [];
    final contents = await file.readAsString();
    if (contents.trim().isEmpty) return [];
    final data = jsonDecode(contents) as List;
    return data.map((n) => Note.fromJson(n as Map<String, dynamic>)).toList();
  } catch (e) {
    stderr.writeln('Error loading notes: $e');
    return [];
  }
}

Future<void> createNote() async {
  stdout.write('Enter note title: ');
  final title = stdin.readLineSync() ?? '';

  stdout.write('Enter note body: ');
  final body = stdin.readLineSync() ?? '';

  // Cargar las existentes para calcular el próximo id
  final notes = await loadNotes();
  final nextId = (notes.isEmpty) ? 1 : (notes.map((n) => n.id).reduce((a, b) => a > b ? a : b) + 1);

  final note = Note(
    id: nextId,
    title: title,
    body: body,
    createdAt: DateTime.now().toUtc(),
  );

  notes.add(note);
  await saveNotes(notes);

  print('Note added\n');
}

Future<void> printAllNotes() async {
  final notes = await loadNotes();
  if (notes.isEmpty) {
    print('No notes yet.\n');
    return;
  }

  print('\n===== NOTES (${notes.length}) =====');
  for (final n in notes) {
    final dateLocal = n.createdAt.toLocal();
    final shortDate =
        '${dateLocal.year}-${dateLocal.month.toString().padLeft(2, '0')}-${dateLocal.day.toString().padLeft(2, '0')} '
        '${dateLocal.hour.toString().padLeft(2, '0')}:${dateLocal.minute.toString().padLeft(2, '0')}';
    print('[${n.id}] ${n.title}  |  $shortDate');
    print(n.body);
    print('-----------------------------------');
  }
  print('');
}

Future<void> syncNotesToServer(List<Note> notes) async {
  try {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(notes.map((n) => n.toJson()).toList()),
    );

    if (response.statusCode == 201) {
      print('Notas enviadas al servidor correctamente.');
    } else {
      print('Error al enviar notas: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// --- Traer notas del servidor y guardarlas localmente ---
Future<void> fetchNotesFromServer() async {
  try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Convertimos solo las primeras 5 en notas para probar
      final notes =
          data.take(5).map((json) => Note.fromJson(json)).toList();

      final file = File('storage/notes.json');
      await file.writeAsString(
        jsonEncode(notes.map((n) => n.toJson()).toList()),
      );

      print('Notas obtenidas del servidor y guardadas localmente.');
    } else {
      print('Error al obtener notas: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
Future<void> main() async {
  // 1. Crear una lista de notas de prueba
  final notes = [
    Note(
    id: 1,
    title: "Primera nota",
    body: "Este es el cuerpo de la primera nota",
    createdAt: DateTime.now(),
  ),
  Note(
    id: 2,
    title: "Segunda nota",
    body: "Otra nota para probar guardado y carga",
    createdAt: DateTime.now(),
  ),
  ];

  print("Guardando notas...");
  await saveNotes(notes); // Guarda en notes.json

  print("\nCargando notas...");
  final loaded = await loadNotes();

  print("\nNotas cargadas desde archivo:");
  for (var n in loaded) {
    print(n);
  }

  print("\nArchivo generado en storage/notes.json:");
  print(File('storage/notes.json').readAsStringSync());
}