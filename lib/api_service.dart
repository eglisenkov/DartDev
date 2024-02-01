import 'dart:convert';
import 'dart:io';

import 'package:dart_train/model/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<void> fethPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw HttpException(
            'Что-то не так. Code of server : ${response.statusCode}');
      }

      final jsonString = response.body;
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Post> posts =
          jsonList.map((post) => Post.fromJson(post)).toList();

      for (var post in posts) {
        print('Post ID: ${post.id}, Title: ${post.title}');
      }
    } on SocketException {
      print('Не удаётся получить доступ к ресурсу');
    } on FormatException {
      print('Неправильный формат данных');
    } catch (error) {
      print(error);
    }
  }
}
