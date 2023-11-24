import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TextView(
            text: 'Acerca de la Aplicación para Acuarios',
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          const Icon(
            CupertinoIcons.info_circle,
            size: 40,
            color: Colors.teal,
          ),
          const SizedBox(height: 20),
          const TextView(
            text: 'Bienvenido a la Aplicación para Acuarios',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const TextView(
            text:
                'Esta aplicación está diseñada para los amantes de los acuarios, ya sean principiantes o expertos en acuarismo. Aquí encontrarás herramientas útiles, información sobre peces, consejos de cuidado y mucho más.',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          const TextView(
            text:
                '¡Explora el mundo fascinante de los acuarios y crea un entorno acuático vibrante para tus peces!',
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 35),
          CustomButton(
            buttonTextColor: Colors.black,
            isAppColor: false,
            text: 'Entendido!',
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
