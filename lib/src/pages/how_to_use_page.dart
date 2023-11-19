/*
import 'package:flutter/material.dart';


class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [
          Text("Instrucciones",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold)
          ),
          InstruccionCard(
            texto: "Instrucción 1",
            imagenCorrecta: "assets/correcto.png",
            imagenIncorrecta: "assets/incorrecto.png",
          ),
          InstruccionCard(
            texto: "Instrucción 2",
            imagenCorrecta: "assets/correcto.png",
            imagenIncorrecta: "assets/incorrecto.png",
          )
          ]
          );
  }
}

class InstruccionCard extends StatelessWidget {
  final String texto;
  final String imagenCorrecta;
  final String imagenIncorrecta;

  const InstruccionCard({super.key, 
    required this.texto,
    required this.imagenCorrecta,
    required this.imagenIncorrecta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            texto,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(imagenCorrecta, width: 100, height: 100),
              Image.asset(imagenIncorrecta, width: 100, height: 100),
            ],
          ),
        ],
      ),
    );
  }
}*/