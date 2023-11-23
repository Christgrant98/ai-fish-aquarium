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
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: TextView(
            text: "Acuario",
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: PhotoView(
            backgroundDecoration:
                const BoxDecoration(color: Colors.transparent),
            imageProvider: const AssetImage("assets/mapa.png"),
          ),
        ),
      ]),
    );
  }
}
