import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/explorer_activity_model.dart';

final actividades = <ExplorerActivity>[
  ExplorerActivity(activity: "Tómale foto a 5 peces de agua dulce"),
  ExplorerActivity(activity: "Tómale foto a 5 peces de agua salada"),
  ExplorerActivity(activity: "Tómale foto a la anguilla, recuerda NO usar el flash."),
  ExplorerActivity(activity: "Tómale foto al tiburón, cuidado está sobre tí"),
  ExplorerActivity(activity: "Tómale foto al pez que mas te hace reir y es todo un payaso"),
];

createActivities() async{
  final ExplorerActivityRepository explorerRepository = ExplorerActivityRepository();

  for (ExplorerActivity activity in actividades){
    await explorerRepository.insert(item: activity);
  }
}