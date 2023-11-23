import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/forms/login_form.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';

import '../utils/widgets/text_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        hasBottomNavigationBar: false,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width * .85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle('Login'),
                  const SizedBox(height: 30),
                  const LoginForm(),
                  const SizedBox(height: 30),
                  _buildAskForRegistration(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildTitle(String text) {
    return TextView(
      text: text,
      fontSize: 28,
      color: Colors.teal,
      fontWeight: FontWeight.w900,
    );
  }

  Widget _buildAskForRegistration(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'No tienes una cuenta? ',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: 'Registrate',
            style: GoogleFonts.lato(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
              fontSize: 14,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.go("/registro"),
          ),
        ],
      ),
    );
  }
}
