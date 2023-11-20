import 'package:flutter/material.dart';

import '../utils/widgets/custom_button.dart';
import '../utils/widgets/text_view.dart';

class RecompensasView extends StatelessWidget {
  final int points;

  const RecompensasView({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TextView(
            text: "Recompensas",
            fontSize: 20,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade900,
            ),
            child: Column(
              children: [
                TextView(
                  text: "Puntos de explorador: $points",
                  color: Colors.white,
                ),
                const PromoWidget(
                  promocion:
                      "Obtén un 20% de descuento en la tienda del zoológico",
                  puntosRequeridos: 2000,
                ),
                const PromoWidget(
                  promocion:
                      "Obtén un 15% de descuento en la tienda del zoológico",
                  puntosRequeridos: 1500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PromoWidget extends StatelessWidget {
  final String promocion;
  final int puntosRequeridos;

  const PromoWidget(
      {super.key, required this.promocion, required this.puntosRequeridos});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextView(
                text: promocion,
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/Jackie_Chan.jpg', // Reemplaza con la ruta correcta de tu imagen
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                TextView(
                  text: puntosRequeridos.toString(),
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                const SizedBox(height: 8.0),
                CustomButton(
                  onPressed: () {
                    // Lógica para el botón
                  },
                  text: 'Canjear',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
