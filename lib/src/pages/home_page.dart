import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';

import '../utils/widgets/custom_button.dart';
import '../utils/widgets/text_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      hasBottomNavigationBar: false,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                context.go("/login");
              },
              text: "Iniciar Sesión",
            ),
            CustomButton(
              onPressed: () {
                context.go("/registro");
              },
              color: Colors.teal,
              text: "Regístrate",
            )
          ]),
    );
  }
}
