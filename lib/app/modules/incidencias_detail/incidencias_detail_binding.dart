import 'package:get/get.dart';

import 'incidencias_detail_logic.dart';

class IncidenciasDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncidenciasDetailLogic(idIncide: Get.parameters['idIncide'] ?? '0'));
  }
}
