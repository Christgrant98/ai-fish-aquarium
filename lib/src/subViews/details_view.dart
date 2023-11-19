import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/recognized.dart';
import 'package:login_flutter/src/providers/peces_recognized.dart';
import 'package:login_flutter/src/providers/photos_peces.dart';
import 'package:login_flutter/src/services/langchain.dart';
import 'package:login_flutter/src/services/openai/chat_service.dart';
import 'package:provider/provider.dart';

import '../utils/widgets/custom_progress_indicator.dart';

class DetailsView extends StatefulWidget {
  final File image;
  final String fishName;

  const DetailsView({super.key, required this.image, required this.fishName});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(widget.image, fit: BoxFit.cover),
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
              widget.fishName != ""
                  ? Text(
                      widget.fishName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  : const Text(""),
              const SizedBox(height: 15),
              FutureBuilder(
                  future: _getDescription(context),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('Presiona el botón para comenzar.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CustomProgressIndicator();
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return Text(
                          '${snapshot.data}',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 15,
                          ),
                        );
                    }
                  }),
            ],
          ),
        )
      ]),
    );
  }

  Future<String?> _getDescription(BuildContext context) async {
    if (widget.fishName != "") {
      final photoProvider =
          Provider.of<PhotosPecesProvider>(context, listen: false);
      final recognizedProvider =
          Provider.of<PecesRecognizedProvider>(context, listen: false);
      final PezRecognized? pez =
          recognizedProvider.getPezPorNombre(widget.fishName);
      if (!photoProvider.setPeces.contains(pez) && pez != null) {
        photoProvider.agregarPez(pez);
        //ExplorerAgent agent = ExplorerAgent();
        //agent.runAgent();
      }

      return await ChatService().request(
          "dame información en español y datos curiosos sobre el pez ${widget.fishName}, se breve");
    } else {
      return "No se pudo reconocer ese Pez";
    }
  }
}
