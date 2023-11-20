import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/providers/user_provider.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:login_flutter/src/utils/widgets/email_form_field.dart';
import 'package:login_flutter/src/utils/widgets/password_form_field.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailFormField(controller: emailController),
          const SizedBox(height: 25),
          PasswordFormField(controller: passwordController),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                UserRepository userRepository = UserRepository();
                userRepository
                    .selectUserFromCredentials(
                        mail: emailController.text,
                        password: passwordController.text)
                    .then((user) {
                  if (user != null) {
                    final userProvider =
                        Provider.of<UserProvider>(context, listen: false);
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
    );
  }

  void _showFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TextView(text: "Login Failed"),
          content:
              const TextView(text: "Tu inicio de sesión no pudo ser realizado"),
          actions: <Widget>[
            TextButton(
              child: const TextView(text: "OK"),
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
