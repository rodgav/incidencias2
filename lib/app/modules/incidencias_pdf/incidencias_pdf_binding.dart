import 'package:get/get.dart';

import 'incidencias_pdf_logic.dart';

class IncidenciasPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncidenciasPdfLogic(idIncide: Get.parameters['idIncide'] ?? '0'));
  }
}
