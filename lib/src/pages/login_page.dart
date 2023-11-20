import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/forms/login_form.dart';

import '../utils/widgets/text_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            width: MediaQuery.of(context).size.width * .85,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: "Login",
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(height: 30),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
