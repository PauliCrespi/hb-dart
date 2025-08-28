import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart'; // archivo generado automáticamente

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  /// Factory constructor para crear un User desde JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Método para convertir un User a JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
