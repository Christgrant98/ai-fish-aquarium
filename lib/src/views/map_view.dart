import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart'; 


class MapaView extends StatelessWidget {
  const MapaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children:[
      const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text("Acuario",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white),
          ),
      ),
      Expanded(
        child: PhotoView(
          backgroundDecoration: 
          const BoxDecoration(
            color: Colors.transparent),
          imageProvider: const AssetImage("assets/mapa.png"),
          ),
      ),
    ]
    );
  }
}
