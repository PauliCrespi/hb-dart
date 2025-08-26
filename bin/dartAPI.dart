import 'package:http/http.dart' as http;
import 'dart:convert'; 

Future<Map<String, String>> fetchPost() async {
  try {
    // Hacer el GET request
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    if (response.statusCode == 200) {
      // Decodificar el JSON
      final data = jsonDecode(response.body);

      // Extraer title y body
      return {
        'title': data['title'] ?? '',
        'body': data['body'] ?? ''
      };
    } else {
      // Si no responde 200, devolver mensaje de error
      return {
        'title': 'Unavailable',
        'body': 'Error fetching post'
      };
    }
  } catch (e) {
    // Manejo de error de conexión
    return {
      'title': 'Unavailable',
      'body': 'Error fetching post'
    };
  }
}

Future<List<String>> fetchPostTitles() async {
    try {
    // Hacer el GET request
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      // Decodificar el JSON
      final List<dynamic> data = jsonDecode(response.body);
      final titles = data.map((post) => post['title'].toString()).toList();
      return titles;
    } else {
      // Si no responde 200, devolver mensaje de error
      return ['Unavailable'];
    }
    }catch (e){
      return ['Unavailable'];
    }
}

Future<int> sendPost() async {
  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // JSON body a enviar
    final body = jsonEncode({
      'title': 'Hello',
      'body': 'This is a test post',
      'userId': 1
    });

    // Realizar POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: body,
    );

    if (response.statusCode == 201) {
      // Decodificar respuesta
      final data = jsonDecode(response.body);
      return data['id']; // Devuelve el campo id
    } else {
      print('Error: ${response.statusCode}');
      return -1; // valor de error
    }
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}




