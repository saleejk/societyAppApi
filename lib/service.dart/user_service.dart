// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';

// class UserService {
//   final dio = Dio();
//   Future<void> createUser(userInfo) async {
//     try {
//       final endpoint = 'http://socialmedia-api-v1.onrender.com/auth/register';
//       log('bbbbbbbbbbbbbbbbbbbbbbbbbbbb');
//       await dio.post(endpoint, data: jsonEncode(userInfo));

//       log('ccccccccccccccccccccccccccccccccccccc');
//     } on DioException catch (e) {
//       if (e.response != null) {
//         log("${e.response?.data}");
//       }
//     }
//   }

//   userLogin(userInfo) async {
//     const url = "socialmedia-api-v1.onrender.com/auth/login";
//     try {
//       Response response = await dio.post(url,
//           // options: Options(headers: {"Content-Type": "application/json"}),
//           data: jsonEncode(userInfo));

//       if (response.statusCode == 200) {
//         log('User Logged in');
//       } else if (response.statusCode == 500) {
//         log('User login failed,status code: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       log('$e');
//       rethrow;
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class UserService {
  final Dio dio = Dio();

  Future<void> createUser(Map<String, dynamic> userInfo) async {
    try {
      final endpoint = 'http://socialmedia-api-v1.onrender.com/auth/register';
      log('Creating user...');
      await dio.post(endpoint, data: jsonEncode(userInfo));
      log('User created successfully');
    } on DioError catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
      rethrow; // Rethrow the error after handling
    }
  }

  Future<void> userLogin(Map<String, dynamic> userInfo) async {
    final url = "http://socialmedia-api-v1.onrender.com/auth/login";
    try {
      log('Logging in user...');
      Response response = await dio.post(
        url,
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(userInfo),
      );

      if (response.statusCode == 200) {
        log('User Logged in');
      } else if (response.statusCode == 500) {
        log('User login failed,status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }
}
