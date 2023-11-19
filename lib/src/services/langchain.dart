import 'dart:async';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/explorer_activity_model.dart';
import 'package:login_flutter/src/services/openai/api_key.dart';

class ExplorerAgent{
  late AgentExecutor executor;

  ExplorerAgent(){
   final llm = ChatOpenAI(
    apiKey: ApiKey.openAIApiKey,
    model: 'gpt-3.5-turbo-0613',
    temperature: 0,
  );
  final tools = [
    Tool.fromFunction(name: "getFishList", description: "Retorna la lista de todos los peces a los que se les ha tomado fotos recibe como argumento la string getFish", func: getFishList),
    Tool.fromFunction(name: "getActivities", description: "Retorna la lista de las actividades de explorador", func: getActivities),
    Tool.fromFunction(name: "activityDone", description: "recibe la lista de las actividades que se deben marcar como resueltas usar las mismas actividades recibidas por getActivities", func: getFishList),
  ];
  final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);
  executor = AgentExecutor(agent: agent);
  }

  Future<String> runAgent() async{
    return await executor.run('De los peces que se han tomado fotos verifica las actividades de explorador que tienen que ver con los peces y marca como resueltas las que han sido resueltas, ten en cuenta que las actividaes pueden tener figurados tu tarea es analizar la tarea y los peces que podrian tener que ver con la tarea');
  }

  String getFishList(String peces){
    String pescados = ["clown fish"].toString();
    return pescados;
  }

  Future<String> getActivities(String actividades) async {
    ExplorerActivityRepository explorerRepository = ExplorerActivityRepository();
    List<ExplorerActivity> activities = await explorerRepository.getAll();
    String act = activities.toString(); 
    return  act;
  }

  String activityDone(String activities){
    return "success";
  }
}