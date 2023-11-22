import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/explorer_activity_model.dart';
import 'package:login_flutter/src/utils/widgets/custom_card.dart';

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
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        const SizedBox(height: 10),
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
          },
        ),
        const SizedBox(height: 15),
        CustomButton(
          onPressed: () {
            context.go("/home_view/explorer/recompensas", extra: {"points": 0});
          },
          text: "Recompensas",
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
      misiones.add(
        MissionWidget(
          missionText: activity.activity,
          isCompleted: activity.isCompleted!,
        ),
      );
    }
    return Container(
      height: 470,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            children: misiones,
          ),
        ),
      ),
    );
  }
}

class MissionWidget extends StatelessWidget {
  final String missionText;
  final bool isCompleted;

  const MissionWidget(
      {super.key, required this.missionText, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: CustomCard(
        title: missionText,
        titleSize: 14,
        titleWeight: FontWeight.w400,
        icon: isCompleted ? Icons.check : Icons.close,
        backgroundColor: Colors.white,
        iconColor: isCompleted ? Colors.green : Colors.red,
      ),
    );
  }
}
