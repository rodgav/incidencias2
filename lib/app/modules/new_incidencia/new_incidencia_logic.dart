import 'package:get/get.dart';
import 'package:incidencias2/app/routes/app_pages.dart';

class NewIncidenciaLogic extends GetxController {
  void toNewFicha() {
    Get.rootDelegate.toNamed(Routes.newFicha);
  }
}
