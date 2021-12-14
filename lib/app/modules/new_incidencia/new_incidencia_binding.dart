import 'package:get/get.dart';

import 'new_incidencia_logic.dart';

class NewIncidenciaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewIncidenciaLogic());
  }
}
