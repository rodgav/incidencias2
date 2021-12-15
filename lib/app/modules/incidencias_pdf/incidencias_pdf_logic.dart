import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/fichas_model.dart';
import 'package:incidencias2/app/data/models/incides_model.dart';
import 'package:incidencias2/app/data/repositorys/db_repository.dart';

class IncidenciasPdfLogic extends GetxController {
  String idIncide;

  IncidenciasPdfLogic({required this.idIncide});


  final _dataRepository = Get.find<DbRepository>();

  IncidencesModel? _incidencesModel;
  FichasModel? _fichasModel;

  IncidencesModel? get incidencesModel => _incidencesModel;

  FichasModel? get fichasModel => _fichasModel;

  @override
  void onReady() {
    _getIncidencia();
    _getFichas();
    super.onReady();
  }

  void _getIncidencia() async {
    _incidencesModel = await _dataRepository.getIncidId(idIncid: idIncide);
    update(['incidencia']);
  }

  void _getFichas() async {
    _fichasModel = await _dataRepository.getFichas(idIncid: idIncide);
    update(['incidencia']);
  }
}
