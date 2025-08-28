import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getJsonResponse(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    return null; // o un valor por defecto
  }
}

Future<Map<String, String>> fetchPost() async {
  final data = await getJsonResponse('https://jsonplaceholder.typicode.com/posts/1');

  if (data != null) {
    return {
      'title': data['title'].toString(),
      'body': data['body'].toString(),
    };
  } else {
    return {
      'title': 'Unavailable',
      'body': 'Error fetching post',
    };
  }
}

Future<List<String>> fetchPostTitles() async {
  final data = await getJsonResponse('https://jsonplaceholder.typicode.com/posts');

  if (data != null && data is List) {
    return data.map((post) => post['title'].toString()).toList();
  } else {
    return ['Unavailable'];
  }
}
