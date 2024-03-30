import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app/controller/user_controller.dart';
import 'package:society_app/view/home.dart';
import 'package:society_app/view/register.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController usernameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // void logIn(String email, password) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse('http://socialmedia-api-v1.onrender.com/auth/login'),
  //         body: {'email': email, 'password': password});
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data);
  //       print('login successfull');
  //     } else {
  //       print('failed to login');
  //     }
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('societyApp'),
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                controller: pro.emailC,
                decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                controller: pro.passwordC,
                decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 41, 107, 161)),
                  ),
                  onPressed: () async {
                    await pro.userLogin();
                    // logIn(emailController.text.toString(),
                    //     passwordController.text.toString());
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const Home()));
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot your login details?',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Get help logging in.',
                  style:
                      TextStyle(letterSpacing: 0, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'OR',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => RegisterPage()));
                  },
                  icon: Icon(
                    Icons.photo_filter_rounded,
                    color: Color.fromARGB(255, 41, 107, 161),
                  ),
                  label: Text(
                    'Register',
                    style: TextStyle(
                        color: Color.fromARGB(255, 41, 107, 161),
                        letterSpacing: 0,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
