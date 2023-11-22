import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TextView(
            text: 'Acerca de la Aplicación para Acuarios',
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 20),
          TextView(
            text: 'Bienvenido a la Aplicación para Acuarios',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextView(
            text:
                'Esta aplicación está diseñada para los amantes de los acuarios, ya sean principiantes o expertos en acuarismo. Aquí encontrarás herramientas útiles, información sobre peces, consejos de cuidado y mucho más.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          TextView(
            text:
                '¡Explora el mundo fascinante de los acuarios y crea un entorno acuático vibrante para tus peces!',
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
