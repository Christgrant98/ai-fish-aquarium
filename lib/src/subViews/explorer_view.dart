import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/explorer_activity_model.dart';

import '../utils/widgets/custom_button.dart';
import '../utils/widgets/custom_progress_indicator.dart';
import '../utils/widgets/text_view.dart';

class ExplorerView extends StatelessWidget {
  const ExplorerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextView(
            text: "Actividades de Explorador",
            color: Colors.white,
            fontSize: 20),
        FutureBuilder(
            future: _getActivities(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(child: CustomProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return TextView(text: 'Error: ${snapshot.error}');
                  }
                  return snapshot.data as Widget;
              }
            }),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomButton(
            onPressed: () {
              context
                  .go("/home_view/explorer/recompensas", extra: {"points": 0});
            },
            text: "Recompensas",
          ),
        ),
      ],
    );
  }

  Future<Widget> _getActivities() async {
    ExplorerActivityRepository explorerRepository =
        ExplorerActivityRepository();
    List<ExplorerActivity> activities = await explorerRepository.getAll();
    List<Widget> misiones = [];
    for (ExplorerActivity activity in activities) {
      misiones.add(MissionWidget(
          missionText: activity.activity, isCompleted: activity.isCompleted!));
    }
    return Column(children: misiones);
  }
}

class MissionWidget extends StatelessWidget {
  final String missionText;
  final bool isCompleted;

  const MissionWidget(
      {super.key, required this.missionText, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue, // Fondo azul
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? Colors.green
                  : Colors
                      .red, // Rojo si no se ha completado, verde si se ha completado
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.close, // Icono de chulo o equis
              color: Colors.white, // Color blanco para el icono
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextView(
              text: missionText,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
