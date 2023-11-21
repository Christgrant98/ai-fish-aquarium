import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/providers/carousel_provider.dart';
import 'package:login_flutter/src/utils/widgets/base_modal.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';

import '../subViews/explorer_view.dart';
import '../utils/widgets/card_carousel_image.dart';
import '../utils/widgets/custom_progress_indicator.dart';
import '../utils/widgets/text_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final MaterialColor backgroudCards = Colors.blue;

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
                width: constraints.maxWidth * .92,
                child: Column(children: [
                  const SizedBox(height: 20),
                  _buildTitleHead(),
                  const SizedBox(height: 20),
                  _builCarouselView(),
                  const SizedBox(height: 20),
                  _buildCardOption(
                    title: 'Actividades de explorador',
                    subtitle: 'consulta aqui las actividades de explorades',
                    icon: Icons.explore,
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return const BaseModal(
                            heightFactor: .8,
                            widthFactor: .9,
                            content: ExplorerView(),
                          );
                        }),
                  ),
                  _buildCardOption(
                    title: 'Album de campo',
                    subtitle: 'consulta aqui Album de campo',
                    onTap: () => GoRouter.of(context).go('/home_view/album'),
                    icon: Icons.photo_library,
                  ),

                  const SizedBox(height: 20),
                  // _cardImagenTexto()
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

  Widget _buildCardOption({
    required String title,
    required String subtitle,
    required void Function() onTap,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.teal,
        elevation: 5,
        child: SizedBox(
          height: 100,
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              title: TextView(
                text: title,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
              subtitle: TextView(
                text: subtitle,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
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

  // Widget _cardImagenTexto() {
  //   return Container(
  //     margin: lateralMargin,
  //     decoration: BoxDecoration(
  //       color: backgroudCards, // Color de fondo del widget
  //       borderRadius: BorderRadius.circular(8), // Bordes redondeados
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 2,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const TextView(
  //                 text: "¿Cómo utilizar la app?",
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               const TextView(
  //                 text:
  //                     "Aquí encontrarás las instrucciones para hacer uso correcto de la aplicación y cómo funciona.",
  //               ),
  //               CustomButton(
  //                 onPressed: () {
  //                   GoRouter.of(context).go('/home_view/instructions');
  //                 },
  //                 text: "¡Vamos!",
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(width: 16), // Espacio entre los elementos
  //         Container(
  //           constraints: const BoxConstraints(
  //             maxHeight: 100, // Altura máxima para la imagen
  //           ),
  //           decoration: BoxDecoration(
  //             color: Colors.red,
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(20),
  //             child: const FadeInImage(
  //               placeholder: AssetImage("assets/loading3.gif"),
  //               image: AssetImage("assets/carousel/tiger_oscar.jpg"),
  //               fit: BoxFit.cover, // Ajuste de la imagen
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
