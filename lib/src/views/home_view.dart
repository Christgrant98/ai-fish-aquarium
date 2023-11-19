import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/pages/carousel_details.dart';
import 'package:login_flutter/src/providers/carousel_provider.dart';
import 'package:login_flutter/src/utils/widgets/base_modal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final MaterialColor backgroudCards = Colors.blue;

  final EdgeInsetsGeometry lateralMargin =
      const EdgeInsets.symmetric(horizontal: 20.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 10),
        const Text(
          "Fotos De la Semana",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        FutureBuilder<List<Pez>>(
            future: carouselProvider.cargarData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index, realIndex) {
                      final carouselImage = snapshot.data![index];
                      return CardImages(carouselImages: carouselImage);
                    },
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      autoPlayInterval: const Duration(seconds: 5),
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                    ));
              } else {
                return const CircularProgressIndicator();
              }
            }),
        const SizedBox(height: 20),
        Container(
          margin: lateralMargin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/home_view/explorer');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.all(8), // Espacio interno del widget
                    decoration: BoxDecoration(
                      color: backgroudCards, // Color de fondo del widget
                      borderRadius:
                          BorderRadius.circular(10), // Bordes redondeados
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Actividades de explorador",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.explore,
                            size: 60, color: Colors.white), // Icono y tamaño
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/home_view/album');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.all(10), // Espacio interno del widget
                    decoration: BoxDecoration(
                      color: backgroudCards, // Color de fondo del widget
                      borderRadius:
                          BorderRadius.circular(8), // Bordes redondeados
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Álbum de campo",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.photo_library,
                            size: 60, color: Colors.white), // Icono y tamaño
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _cardImagenTexto()
      ]),
    );
  }

  Widget _cardImagenTexto() {
    return Container(
      margin: lateralMargin,
      decoration: BoxDecoration(
        color: backgroudCards, // Color de fondo del widget
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "¿Cómo utilizar la app?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Aquí encontrarás las instrucciones para hacer uso correcto de la aplicación y cómo funciona.",
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/home_view/instructions');
                  },
                  child: const Text("¡Vamos!"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16), // Espacio entre los elementos
          Container(
            constraints: const BoxConstraints(
              maxHeight: 100, // Altura máxima para la imagen
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/loading3.gif"),
                image: AssetImage("assets/carousel/tiger_oscar.jpg"),
                fit: BoxFit.cover, // Ajuste de la imagen
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardImages extends StatelessWidget {
  final Pez carouselImages;
  const CardImages({super.key, required this.carouselImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => showDialog(
              context: context,
              builder: (ctx) {
                return BaseModal(
                  heightFactor: .65,
                  widthFactor: .9,
                  content: SingleChildScrollView(
                    child: _buildFishModalContent(),
                  ),
                );
              }),
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading3.gif"),
            image: AssetImage(
              carouselImages.imageRoute,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildFishModalContent() {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading3.gif"),
            image: AssetImage(carouselImages.imageRoute),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              carouselImages.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              carouselImages.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 15,
              ),
            )
          ],
        ),
      )
    ]);
  }
}
