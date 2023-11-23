import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';
import 'package:photo_view/photo_view.dart';

import '../utils/widgets/text_view.dart';

class MapaView extends StatelessWidget {
  const MapaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Column(children: [
        const SizedBox(height: 30),
        const TextView(
          text: "Acuario",
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: const TextView(
            text:
                "Explora el acuario a través de nuestro mapa. Este mapa es simplemente una representación visual para que te familiarices con la disposición general del acuario.",
            fontSize: 15,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: PhotoView(
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            imageProvider: const AssetImage("assets/mapa.png"),
          ),
        ),
      ]),
    );
  }
}
