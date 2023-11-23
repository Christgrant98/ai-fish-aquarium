import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/custom_card.dart';

import '../utils/widgets/text_view.dart';

class RecompensasView extends StatelessWidget {
  final int points;

  const RecompensasView({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const TextView(
          text: "Recompensas",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          padding: const EdgeInsets.only(left: 5, right: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.teal),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextView(
                text: "Puntos de explorador: $points",
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CustomCard(
        hasLeading: true,
        height: 150,
        title: promocion,
        titleSize: 14,
        icon: Icons.money_rounded,
        iconBackgoundColor: const Color.fromARGB(255, 255, 250, 207),
        iconColor: Colors.yellow,
        trailing: Column(
          children: [
            const TextView(text: 'Puntos:'),
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 28,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextView(
                    text: puntosRequeridos.toString(),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
