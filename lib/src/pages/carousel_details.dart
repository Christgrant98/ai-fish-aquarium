import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/peces_model.dart';

import '../utils/widgets/text_view.dart';

class CarouselDetails extends StatelessWidget {
  final Pez carouselImages;
  const CarouselDetails({super.key, required this.carouselImages});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
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
              TextView(
                text: carouselImages.name,
                color: Colors.white,
                fontSize: 20,
              ),
              const SizedBox(height: 15),
              TextView(
                text: carouselImages.description,
                textAlign: TextAlign.justify,
                color: Colors.yellow,
                fontSize: 15,
              )
            ],
          ),
        )
      ]),
    );
  }
}
