import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/user_model.dart';
import 'package:login_flutter/src/utils/widgets/email_form_field.dart';
import 'package:login_flutter/src/utils/widgets/password_form_field.dart';

import '../utils/widgets/custom_button.dart';
import '../utils/widgets/username_form_field.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  bool _aceptaTerminos = false;
  bool _aceptaNotificacion = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Regístrate"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          EmailFormField(
                            controller: _emailController,
                          ),
                          const SizedBox(height: 30),
                          PasswordFormField(
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 30),
                          UsernameFormField(
                            controller: _usernameController,
                          ),
                          const SizedBox(height: 30),
                          CheckBoxWithText(
                              value: _aceptaTerminos,
                              onChanged: (value) {
                                setState(() {
                                  _aceptaTerminos = value!;
                                });
                              },
                              text: RichText(
                                text: TextSpan(
                                  text: 'Acepto los ',
                                  style: const TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'términos y condiciones',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("Terminos de servicio");
                                        },
                                    ),
                                    const TextSpan(
                                        text: ' de uso.',
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              )),
                          CheckBoxWithText(
                              value: _aceptaNotificacion,
                              onChanged: (value) {
                                setState(() {
                                  _aceptaNotificacion = value!;
                                });
                              },
                              text: const Text(
                                'Acepto recibir información, promociones y noticias en mi correo por parte del Zoológico de Cali.',
                                overflow: TextOverflow
                                    .ellipsis, // Recorta el texto si es demasiado largo
                                maxLines: 5, // Muestra solo una línea de texto
                              )),
                          CustomButton(
                            onPressed: () {
                              if (!_aceptaTerminos) {
                                _showOkDialog(
                                    context: context,
                                    title: "Términos Requeridos",
                                    content:
                                        "Necesitas aceptar los Términos y Condiciones para regístrarte.");
                              }
                              if (_formKey.currentState!.validate() &&
                                  _aceptaTerminos) {
                                final UserRepository userRepository =
                                    UserRepository();
                                userRepository
                                    .exist(mail: _emailController.text)
                                    .then(
                                  (existe) {
                                    if (!existe) {
                                      User user = User(
                                          username: _usernameController.text,
                                          password: _passwordController.text,
                                          mail: _emailController.text,
                                          profilePicture: "assets/default.jpg");
                                      userRepository.insert(item: user).then(
                                          (value) => _showOkDialog(
                                              context: context,
                                              title: "Registration Successful",
                                              content:
                                                  "Tu registro fue satisfactorio ahora puedes iniciar sesión."));
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _showOkDialog(
      {required BuildContext context,
      required title,
      required String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
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

class CheckBoxWithText extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget text;

  const CheckBoxWithText({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: text,
        ),
      ],
    );
  }
}
