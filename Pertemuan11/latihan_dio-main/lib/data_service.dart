import 'package:dio/dio.dart';
import 'user.dart';

class DataService {
  final Dio dio = Dio();
  final String baseURL = 'https://reqres.in/api';

  Future<Iterable<User>?> getUsersModel() async {
    try {
      final response = await dio.get('$baseURL/users');

      if (response.statusCode == 200) {
        final users = (response.data['data'] as List)
            .map((user) => User.fromJson(user))
            .toList();

        return users;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCreate?> postUser(UserCreate user) async {
    try {
      final response = await dio.post(
        '$baseURL/users',
        data: user.toMap(),
      );

      if (response.statusCode == 201) {
        return UserCreate.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<UserUpdate?> putUser(UserUpdate user) async {
    try {
      final response = await dio.put(
        '$baseURL/users/${user.id}',
        data: user.toMap(),
      );

      if (response.statusCode == 200) {
        return UserUpdate.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future deleteUser(String idUser) async {
    try {
      final response = await dio.delete('$baseURL/users/$idUser');

      if (response.statusCode == 204) {
        return 'Data User Sudah Dihapus';
      }
    } catch (e) {
      rethrow;
    }
  }
}
