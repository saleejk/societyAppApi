import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app/controller/user_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userP = Provider.of<UserController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register Now'),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: TextFormField(
                controller: userP.emailC,
                decoration: InputDecoration(
                    labelText: "email",
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
              child: TextFormField(
                controller: userP.usernameC,
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
                controller: userP.passwordC,
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
                  onPressed: () {
                    userP.createUser();
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (ctx) => BottomNav()));
                  },
                  child: Text(
                    "Sign in",
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
                Icon(
                  Icons.facebook_outlined,
                  color: Color.fromARGB(255, 41, 107, 161),
                ),
                Text(
                  'Log in',
                  style: TextStyle(
                      color: Color.fromARGB(255, 41, 107, 161),
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
