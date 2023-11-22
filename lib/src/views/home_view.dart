import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/providers/carousel_provider.dart';
import 'package:login_flutter/src/subViews/about_us_view.dart';
import 'package:login_flutter/src/utils/widgets/base_modal.dart';
import 'package:login_flutter/src/utils/widgets/custom_card.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';

import '../subViews/explorer_view.dart';
import '../utils/widgets/card_carousel_image.dart';
import '../utils/widgets/custom_progress_indicator.dart';
import '../utils/widgets/text_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final EdgeInsetsGeometry lateralMargin =
      const EdgeInsets.symmetric(horizontal: 20.0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Layout(
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: constraints.maxWidth * .95,
                child: Column(children: [
                  const SizedBox(height: 15),
                  _buildTitleHead(),
                  const SizedBox(height: 15),
                  _builCarouselView(),
                  const SizedBox(height: 15),
                  CustomCard(
                    title: 'Actividades de explorador',
                    subtitle: 'consulta aqui las actividades de explorades',
                    icon: Icons.explore,
                    iconColor: Colors.orange,
                    backgroundColor: const Color.fromARGB(255, 255, 220, 168),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const BaseModal(
                          heightFactor: .8,
                          widthFactor: .9,
                          content: ExplorerView(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomCard(
                    title: 'Album de campo',
                    subtitle: 'consulta aqui Album de campo',
                    backgroundColor: const Color.fromARGB(255, 152, 209, 255),
                    iconColor: Colors.blue,
                    icon: Icons.photo_library,
                    onTap: () => GoRouter.of(context).go(
                      '/home_view/album',
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomCard(
                    title: '¿Cómo utilizar la app?',
                    subtitle:
                        'Aquí encontrarás las instrucciones para hacer uso correcto de la aplicación y cómo funciona.',
                    iconColor: Colors.black,
                    backgroundColor: Colors.white,
                    icon: Icons.info_rounded,
                    onTap: () => GoRouter.of(context).go(
                      '/home_view/instructions',
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomCard(
                    title: 'About us',
                    subtitle: 'Learn More About Us...',
                    backgroundColor: const Color.fromARGB(255, 255, 196, 196),
                    iconColor: Colors.red,
                    icon: Icons.rocket_launch_rounded,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const BaseModal(
                              heightFactor: .5,
                              widthFactor: .9,
                              content: AboutUsView(),
                            );
                          });
                    },
                  ),
                  const SizedBox(height: 100),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleHead() {
    return RichText(
      text: TextSpan(
        text: 'Destacados de la ',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 27.5,
        ),
        children: [
          TextSpan(
            text: 'Semana',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w900,
              color: Colors.teal,
            ),
          ),
          TextSpan(
            text: ': Explora las Imágenes de Nuestros ',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Peces',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w900,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _builCarouselView() {
    return FutureBuilder<List<Pez>>(
      future: carouselProvider.cargarData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index, realIndex) {
                final pez = snapshot.data![index];
                return CardImages(pez: pez);
              },
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.easeInOut,
                autoPlay: true,
                aspectRatio: 16 / 12,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ));
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
