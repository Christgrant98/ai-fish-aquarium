import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

import '../models/peces_model.dart';
import '../providers/carousel_provider.dart';

class TriviaGamePage extends StatelessWidget {
  const TriviaGamePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: Column(
        children: [
          SizedBox(height: 35),
          TextView(
            text: 'Trivia',
            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          SizedBox(height: 35),
          TriviaView(),
        ],
      ),
    );
  }
}

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
