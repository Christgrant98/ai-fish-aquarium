import 'package:flutter/material.dart';

import '../utils/widgets/text_view.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: const SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
              text:
                  "Tomar fotos de buena calidad ayudan con la identificacion de los peces",
              fontSize: 20,
              color: Colors.white),
          SizedBox(
            height: 30,
          ),
          TextView(
              text:
                  "1. el pez debe aparecer dentro del recuadro de la foto, asegúrate que no esté muy lejos.",
              fontSize: 20,
              color: Colors.white),
          CustomImagePair(
              imagePath1: "assets/instructions/1.1.png",
              imagePath2: "assets/instructions/1.2.png"),
          TextView(
              text:
                  "2. Evita que la foto del pez se vea obstruida por la vegetación, el recinto u otros objetos.",
              fontSize: 20,
              color: Colors.white),
          CustomImagePair(
              imagePath1: "assets/instructions/2.1.png",
              imagePath2: "assets/instructions/2.2.png"),
          TextView(
              text:
                  "3. Ten buena iluminación para un mejor contraste al momento de tomar la foto.",
              fontSize: 20,
              color: Colors.white),
          CustomImagePair(
              imagePath1: "assets/instructions/3.1.png",
              imagePath2: "assets/instructions/3.2.png"),
          TextView(
              text:
                  "4. Pero POR FAVOR, NO uses el flash, algunos peces son muy sensibles a la luz.",
              fontSize: 20,
              color: Colors.white),
          CustomImagePair(
              imagePath1: "assets/instructions/4.1.png",
              imagePath2: "assets/instructions/4.2.png"),
          TextView(
              text:
                  "5. Trata de tomarle la foto a un solo espécimen a la vez, puede que se dificulte la identificación si hay varias especies.",
              fontSize: 20,
              color: Colors.white),
          CustomImagePair(
              imagePath1: "assets/instructions/5.1.png",
              imagePath2: "assets/instructions/5.2.png"),
        ],
      )),
    );
  }
}

class CustomImagePair extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;

  const CustomImagePair(
      {super.key, required this.imagePath1, required this.imagePath2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                imagePath1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20.0), // Espacio entre las imágenes
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                imagePath2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
