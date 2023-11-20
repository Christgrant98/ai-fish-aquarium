import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/providers/user_provider.dart';
import 'package:login_flutter/src/utils/verify_string.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../utils/widgets/email_form_field.dart';
import '../utils/widgets/password_form_field.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Iniciar Sesión"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EmailFormField(
                          controller: _emailController,
                        ),
                        const SizedBox(height: 30.0),
                        PasswordFormField(
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              UserRepository userRepository = UserRepository();
                              userRepository
                                  .selectUserFromCredentials(
                                      mail: _emailController.text,
                                      password: _passwordController.text)
                                  .then((user) {
                                if (user != null) {
                                  final userProvider =
                                      Provider.of<UserProvider>(context,
                                          listen: false);
                                  userProvider.setUser(user);
                                  context.go("/home_view");
                                } else {
                                  _showFailureDialog(context);
                                }
                              });
                            }
                          },
                          color: Colors.teal,
                          text: "Ingresar",
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _showFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login Failed"),
          content: const Text("Tu inicio de sesión no pudo ser realizado"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
