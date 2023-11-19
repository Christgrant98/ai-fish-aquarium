import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/explorer_activity_model.dart';


class _ActivitiesProvider{
  final ExplorerActivityRepository explorerRepository = ExplorerActivityRepository();

  _ActivitiesProvider();

  Future<List<ExplorerActivity>> cargarData() async{
    return explorerRepository.getAll();
  }

}

final activityProvider = _ActivitiesProvider();