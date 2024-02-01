import 'package:dart_train/api_service.dart';

void main() async {
  print('Получение постов...');
  await ApiService().fethPosts();
}
