import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;

  // Constructor normal
  User({required this.id, required this.name, required this.email});

  // Constructor que convierte JSON -> User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
  // Método para convertir un objeto User a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

}

// Función para deserializar lista
List<User> parseUsers(String jsonStr) {
  final List<dynamic> data = jsonDecode(jsonStr); // Decodifica el JSON en lista dinámica
  return data.map((e) => User.fromJson(e)).toList(); // Convierte cada item en un User
}

