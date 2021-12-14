import 'package:get/get.dart';

import 'usuarios_logic.dart';

class UsuariosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsuariosLogic());
  }
}
