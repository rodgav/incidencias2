import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/incides_model.dart';
import 'package:incidencias2/app/data/models/state_inci_model.dart';
import 'package:incidencias2/app/data/repositorys/db_repository.dart';
import 'package:incidencias2/app/routes/app_pages.dart';

class IncidenciasLogic extends GetxController {
  final _dataRepository = Get.find<DbRepository>();
  StateInciModel? _stateInciModel;
  StateInci? _stateInci;
  IncidencesModel? _incidencesModel;

  StateInciModel? get stateInciModel => _stateInciModel;

  StateInci? get stateInci => _stateInci;

  IncidencesModel? get incidencesModel => _incidencesModel;

  @override
  void onReady() {
    _getTypeInci();
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getTypeInci() async {
    _stateInciModel = await _dataRepository.stateInci();
    if (stateInciModel != null) {
      _stateInciModel!.stateInci.insert(0, StateInci(id: 0, name: 'Todos'));
      _stateInci = stateInciModel!.stateInci[0];
      update(['stateInci']);
      _getIncids(stateInci!.id);
    }
  }

  void _getIncids(int idStateInci) async {
    _incidencesModel = await _dataRepository.getIncidences(map: {
      'accion': 'incides',
      'idStateInci': idStateInci == 0 ? '' : idStateInci.toString()
    });
    update(['incidences']);
  }

  void selectTypeInci(StateInci data) {
    _stateInci = data;
    update(['stateInci']);
    _getIncids(data.id);
  }

  void toNewIncid() {
    Get.rootDelegate.offNamed(Routes.newIncidencia);
  }

  void popupSelect(int id, String value) {
    switch (value) {
      case 'pdf':
        Get.rootDelegate.toNamed(Routes.incidenciasPDF(id.toString()));
        break;
      case 'delete':
        break;
      case 'detail':
        Get.rootDelegate.toNamed(Routes.incidenciasDetails(id.toString()));
        break;
    }
  }
}
