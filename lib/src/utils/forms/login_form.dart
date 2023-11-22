import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/providers/user_provider.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:login_flutter/src/utils/widgets/email_form_field.dart';
import 'package:login_flutter/src/utils/widgets/password_form_field.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? mail;
  String? password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailFormField(
            onChange: (String? value, bool valid) {
              setState(() => mail = valid ? value : null);
            },
          ),
          const SizedBox(height: 25),
          PasswordFormField(
            onChange: (String? value, bool valid) {
              setState(() => password = valid ? value : null);
            },
          ),
          const SizedBox(height: 30),
          if (_canSubmitForm()) _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        _submitForm(context);
      },
      color: Colors.teal,
      text: "Ingresar",
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      UserRepository userRepository = UserRepository();
      userRepository
          .selectUserFromCredentials(
        mail: mail!,
        password: password!,
      )
          .then(
        (user) {
          if (user != null) {
            final userProvider =
                Provider.of<UserProvider>(context, listen: false);
            userProvider.setUser(user);
            context.go("/home_view");
          } else {
            _showFailureDialog(context);
          }
        },
      );
    }
  }

  bool _canSubmitForm() {
    return mail != null && password != null;
  }

  void _showFailureDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black87,
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
