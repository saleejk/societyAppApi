import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:society_app/service.dart/user_service.dart';

class UserController extends ChangeNotifier {
  TextEditingController emailC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  final UserService userService = UserService();

  createUser() async {
    print(emailC.text);
    print(passwordC.text);
    print(usernameC.text);
    final Map<String, dynamic> requestModel = await {
      "email": emailC.text,
      "password": passwordC.text,
      "username": usernameC.text,
    };

    log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    await userService.createUser(requestModel);
    notifyListeners();
  }

  userLogin() async {
    print('${emailC.text}');
    print("${passwordC.text}");
    final email = emailC.text;
    final password = passwordC.text;
    final Map<String, dynamic> requestModel = await {
      "email": email,
      "password": password,
    };

    print(requestModel);
    await userService.userLogin(requestModel);
    notifyListeners();
  }
  // String username = '';
  // String email = '';

  // setUserData() async {
  //   username = await storeService.getValues('username');
  //   email = await storeService.getValues("email");
  //   notifyListeners();
  // }
}
