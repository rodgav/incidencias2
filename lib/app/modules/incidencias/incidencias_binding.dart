import 'package:get/get.dart';

import 'incidencias_logic.dart';

class IncidenciasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncidenciasLogic());
  }
}
