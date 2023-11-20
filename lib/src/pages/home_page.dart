import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Acuario"),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButton(
                onPressed: () {
                  context.go("/login");
                },
                text: "Iniciar Sesión",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButton(
                onPressed: () {
                  context.go("/registro");
                },
                color: Colors.teal,
                text: "Regístrate",
              ),
            )
          ]),
    );
  }
}
