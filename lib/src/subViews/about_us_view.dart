import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({
    super.key,
  });

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  String urlToZoo = 'https://www.zoologicodecali.com.co/quienes-somos';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TextView(
              text: 'Acerca de la Aplicación para Acuarios',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            const TextView(
              text: 'Bienvenido a la Aplicación para Acuarios!',
              fontWeight: FontWeight.w900,
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/zooCali.png',
              height: 250,
              width: 250,
            ),
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
            const SizedBox(height: 15),
            CustomButton(
              text: 'Launch to zoo page bttn',
              onPressed: () async {
                await _browserLauncherUrl();
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonTextColor: Colors.black,
              isAppColor: false,
              text: 'Entendido!',
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _browserLauncherUrl() async {
    final urlx = Uri.parse(
      urlToZoo,
    );
    if (await canLaunchUrl(urlx)) {
      launchUrl(
        urlx,
        mode: LaunchMode.externalApplication,
      );
    } else {
      print("Can't launch $urlx");
    }
  }
}
