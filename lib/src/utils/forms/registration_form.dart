import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';

import '../../database/database_helper.dart';
import '../../models/user_model.dart';
import '../widgets/email_form_field.dart';
import '../widgets/password_form_field.dart';
import '../widgets/text_view.dart';
import '../widgets/username_form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool aceptaTerminos = false;
  bool aceptaNotificacion = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailFormField(controller: emailController),
          const SizedBox(height: 25),
          PasswordFormField(controller: passwordController),
          const SizedBox(height: 25),
          UsernameFormField(controller: usernameController),
          const SizedBox(height: 20),
          _buildCheckBoxField(
              value: aceptaTerminos,
              onChanged: (value) {
                setState(() {
                  aceptaTerminos = value!;
                });
              },
              child: RichText(
                text: TextSpan(
                  text: 'Acepto los ',
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: 'Términos y Condiciones',
                      style: GoogleFonts.quicksand(
                        color: Colors.teal,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Terminos de servicio");
                        },
                    ),
                    const TextSpan(
                      text: ' de uso.',
                    )
                  ],
                ),
              )),
          _buildCheckBoxField(
            value: aceptaNotificacion,
            onChanged: (value) {
              setState(() {
                aceptaNotificacion = value!;
              });
            },
            child: const TextView(
              text:
                  'Acepto recibir información, promociones y noticias en mi correo por parte del Zoológico de Cali.',
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              if (!aceptaTerminos) {
                _showOkDialog(
                    context: context,
                    title: "Términos Requeridos",
                    content:
                        "Necesitas aceptar los Términos y Condiciones para regístrarte.");
              }
              if (formKey.currentState!.validate() && aceptaTerminos) {
                final UserRepository userRepository = UserRepository();
                userRepository.exist(mail: emailController.text).then(
                  (existe) {
                    if (!existe) {
                      User user = _buildUser();
                      userRepository.insert(item: user).then((value) =>
                          _showOkDialog(
                              context: context,
                              title: "Registration Successful",
                              content:
                                  "Tu registro fue satisfactorio ahora puedes iniciar sesión."));
                      context.go("/login");
                    } else {
                      _showOkDialog(
                          context: context,
                          title: "Registration Failed",
                          content:
                              "Al parecer ya tienes una cuenta por favor inicia sesión.");
                    }
                  },
                );
              }
            },
            text: "Regístrate",
          ),
        ],
      ),
    );
  }

  User _buildUser() {
    User user = User(
        username: usernameController.text,
        password: passwordController.text,
        mail: emailController.text,
        profilePicture: "assets/default.jpg");
    return user;
  }

  void _showOkDialog(
      {required BuildContext context,
      required title,
      required String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextView(text: title),
          content: TextView(text: content),
          actions: <Widget>[
            TextButton(
              child: const TextView(text: "OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCheckBoxField(
      {required bool? value,
      required void Function(bool?)? onChanged,
      required Widget child}) {
    return Row(
      children: [
        Checkbox(
          tristate: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          activeColor: Colors.teal,
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
