import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app/controller/user_controller.dart';
import 'package:society_app/view/home.dart';
import 'package:society_app/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Kanit',
        ),
        home: RegisterPage(),
      ),
    );
  }
}
