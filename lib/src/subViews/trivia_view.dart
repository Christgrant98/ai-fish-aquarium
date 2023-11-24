import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/providers/carousel_provider.dart';

class TriviaView extends StatefulWidget {
  const TriviaView({super.key});

  @override
  State<TriviaView> createState() => _TriviaViewState();
}

class _TriviaViewState extends State<TriviaView> {
  late List<Pez> pecesData;

  @override
  void initState() {
    super.initState();
    cargarPecesData();
  }

  Future<void> cargarPecesData() async {
    pecesData = await carouselProvider.cargarData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: pecesData.length,
        itemBuilder: (context, index) {
          final pez = pecesData[index];
          return Card(
            child: ListTile(
              title: Text(pez.name.toString()),
            ),
          );
        },
      ),
    );
  }
}
