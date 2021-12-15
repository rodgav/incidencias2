import 'package:get/get.dart';

import 'new_ficha_logic.dart';

class NewFichaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => NewFichaLogic(idIncide: Get.parameters['idIncide'] ?? '0'));
  }
}
