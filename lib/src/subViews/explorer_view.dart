import 'package:flutter/material.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/explorer_activity_model.dart';
import 'package:login_flutter/src/subViews/recompensas_view.dart';
import 'package:login_flutter/src/utils/widgets/close_button.dart';
import 'package:login_flutter/src/utils/widgets/custom_card.dart';

import '../utils/widgets/custom_button.dart';
import '../utils/widgets/custom_progress_indicator.dart';
import '../utils/widgets/text_view.dart';

enum StepView {
  initial,
  rewards,
}

class ExplorerView extends StatefulWidget {
  const ExplorerView({super.key});

  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  StepView step = StepView.initial;
  @override
  Widget build(BuildContext context) {
    return _buildViewsByStep();
  }

  Widget _buildViewsByStep() {
    if (step == StepView.initial) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildTitleHeader(),
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
                  setState(() => step = StepView.rewards);
                },
                text: "Recompensas",
              ),
            ],
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: ButtonXmark(),
          )
        ],
      );
    } else {
      return Column(
        children: [
          _buildBackButton(),
          const SizedBox(height: 25),
          const RecompensasView(points: 0),
        ],
      );
    }
  }

  Widget _buildTitleHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: TextView(
        text: "Actividades de Explorador",
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 20,
      ),
    );
  }

  InkWell _buildBackButton() {
    return InkWell(
      onTap: () {
        setState(() => step = StepView.initial);
      },
      child: const Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 22,
          ),
          TextView(
            fontWeight: FontWeight.bold,
            text: 'Go back',
            fontSize: 20,
          )
        ],
      ),
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
    return SizedBox(
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
        iconBackgoundColor: Colors.white,
        iconColor: isCompleted ? Colors.green : Colors.red,
      ),
    );
  }
}
