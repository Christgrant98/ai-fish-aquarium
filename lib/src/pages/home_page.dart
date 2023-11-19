
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Acuario"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){}
          ),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: MaterialButton(
              onPressed: (){
                context.go("/login");
              },
              minWidth: double.infinity,
              color: Colors.teal,
              textColor: Colors.white,
              child: const Text("Iniciar Sesión"),
          
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: MaterialButton(
              onPressed: (){
                context.go("/registro");
              },
              minWidth: double.infinity,
              color: Colors.teal,
              textColor: Colors.white,
              child: const Text("Regístrate"),
              ),
          )
        ]
        ),
      );
  }
}