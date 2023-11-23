import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';

import '../utils/widgets/text_view.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Layout(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: constraints.maxWidth * .85,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  _buidTitleHeader(),
                  const SizedBox(height: 30),
                  _buildInstructionStep(
                    text:
                        "1. El pez debe aparecer dentro del recuadro de la foto. Asegúrate de que no esté muy lejos.",
                    imagePath1: "assets/instructions/1.1.png",
                    imagePath2: "assets/instructions/1.2.png",
                  ),
                  _buildInstructionStep(
                    text:
                        "2. Evita que la foto del pez se vea obstruida por la vegetación, el recinto u otros objetos.",
                    imagePath1: "assets/instructions/2.1.png",
                    imagePath2: "assets/instructions/2.2.png",
                  ),
                  _buildInstructionStep(
                    text:
                        "3. Ten buena iluminación para un mejor contraste al momento de tomar la foto.",
                    imagePath1: "assets/instructions/3.1.png",
                    imagePath2: "assets/instructions/3.2.png",
                  ),
                  _buildInstructionStep(
                    text:
                        "4. Pero POR FAVOR, NO uses el flash. Algunos peces son muy sensibles a la luz.",
                    imagePath1: "assets/instructions/4.1.png",
                    imagePath2: "assets/instructions/4.2.png",
                  ),
                  _buildInstructionStep(
                    text:
                        "5. Trata de tomarle la foto a un solo espécimen a la vez. Puede que se dificulte la identificación si hay varias especies.",
                    imagePath1: "assets/instructions/5.1.png",
                    imagePath2: "assets/instructions/5.2.png",
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buidTitleHeader() {
    return const TextView(
      text:
          "Tomar fotos de buena calidad ayuda con la identificación de los peces",
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w900,
    );
  }

  Widget _buildInstructionStep({
    required String text,
    required String imagePath1,
    required String imagePath2,
  }) {
    return Column(
      children: [
        TextView(
          text: text,
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.justify,
        ),
        CustomImagePair(
          imagePath1: imagePath1,
          imagePath2: imagePath2,
        ),
      ],
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
          const SizedBox(width: 20.0),
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
