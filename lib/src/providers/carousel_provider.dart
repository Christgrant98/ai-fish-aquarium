import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/peces_model.dart';


class _CarouselProvider{
  final PezRepository pezRepository = PezRepository();

  _CarouselProvider();

  Future<List<Pez>> cargarData() async{
    return pezRepository.getAll();
  }

}

final carouselProvider = _CarouselProvider();