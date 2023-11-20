import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/forms/registration_form.dart';
import '../utils/widgets/text_view.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            width: MediaQuery.of(context).size.width * .85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTitle('Register'),
                const SizedBox(height: 30),
                const RegistrationForm(),
                const SizedBox(height: 30),
                _buildAskForLogin(context)
              ],
            ),
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

  Widget _buildAskForLogin(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Ya tienes cuenta? ',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: 'Acceder',
            style: GoogleFonts.lato(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
              fontSize: 14,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.go("/login"),
          ),
        ],
      ),
    );
  }
}
