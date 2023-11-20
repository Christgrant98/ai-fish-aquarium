import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/utils/widgets/custom_progress_indicator.dart';

import '../utils/widgets/text_view.dart';

class CarouselDetails extends StatelessWidget {
  final Pez pez;
  const CarouselDetails({super.key, required this.pez});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(pez.imageRoute),
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
                text: pez.name,
                color: Colors.white,
                fontSize: 20,
              ),
              const SizedBox(height: 15),
              TextView(
                text: pez.description,
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
