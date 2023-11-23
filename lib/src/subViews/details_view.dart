import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/recognized.dart';
import 'package:login_flutter/src/providers/peces_recognized.dart';
import 'package:login_flutter/src/providers/photos_peces.dart';
import 'package:login_flutter/src/services/langchain.dart';
import 'package:login_flutter/src/services/openai/chat_service.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';
import 'package:provider/provider.dart';

import '../utils/widgets/custom_progress_indicator.dart';
import '../utils/widgets/text_view.dart';

class DetailsView extends StatefulWidget {
  final File image;
  final String fishName;
  final int maxCharactersResponseData;

  const DetailsView({
    super.key,
    required this.image,
    required this.fishName,
    this.maxCharactersResponseData = 480,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      hasBottomNavigationBar: true,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 35),
          const TextView(
            text: 'Resultado',
            fontSize: 28,
            color: Colors.teal,
            fontWeight: FontWeight.w900,
          ),
          _buildFishPicResultt(context),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: _buildFishInformationResult(context),
          )
        ]),
      ),
    );
  }

  Widget _buildFishInformationResult(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.fishName != ""
            ? Center(
                child: TextView(
                  text: widget.fishName,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              )
            : const TextView(text: ""),
        const SizedBox(height: 15),
        FutureBuilder(
            future: _getDescription(context),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const TextView(
                      text: 'Presiona el botón para comenzar.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(
                    child: CustomProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: TextView(text: 'Error: ${snapshot.error}'),
                    );
                  }
                  String? dataFish = snapshot.data;
                  print('impresion de la data ${snapshot.data}');
                  print('Longitud de la respuesta: ${dataFish?.length}');
                  return Center(
                    child: TextView(
                      text: dataFish,
                      textAlign: TextAlign.justify,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  );
              }
            }),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFishPicResultt(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: AspectRatio(
        aspectRatio: 9 / 14,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(widget.image, fit: BoxFit.cover),
        ),
      ),
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
          "dame información en español y datos curiosos sobre el pez ${widget.fishName}, se breve, no sobrepases los ${widget.maxCharactersResponseData} caracteres");
    } else {
      return "No se pudo reconocer ese Pez";
    }
  }
}
