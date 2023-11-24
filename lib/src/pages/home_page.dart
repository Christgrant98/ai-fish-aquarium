import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';

import '../utils/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      hasBottomNavigationBar: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: _buildHeaderTitle(),
                ),
                const SizedBox(height: 30),
                CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 175,
                    child: Image.asset(
                      'assets/fish_home.png',
                      height: 250,
                      width: 250,
                    )),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    context.go("/login");
                  },
                  text: "Iniciar Sesión",
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onPressed: () {
                    context.go("/registro");
                  },
                  color: Colors.teal,
                  text: "Regístrate",
                )
              ]),
        ),
      ),
    );
  }

  RichText _buildHeaderTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 27.5,
        ),
        children: const [
          TextSpan(
            text: 'Welcome to the ',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Aquarium',
            style: TextStyle(
              color: Colors.teal, // Color azul
              fontWeight: FontWeight.w900,
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: ' app',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
