import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/repositorys/db_repository.dart';
import 'package:incidencias2/app/data/services/auth_service.dart';
import 'package:incidencias2/app/routes/app_pages.dart';

class NewIncidenciaLogic extends GetxController {
  final _dataRepository = Get.find<DbRepository>();
  final formKey = GlobalKey<FormState>();
  TextEditingController descripcion = TextEditingController();
  TextEditingController nombreIE = TextEditingController();
  TextEditingController codigoMod = TextEditingController();
  TextEditingController codigoLoc = TextEditingController();
  TextEditingController distrito = TextEditingController();
  TextEditingController provincia = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController nombreApellDir = TextEditingController();
  TextEditingController telefDir = TextEditingController();
  TextEditingController dniDir = TextEditingController();
  TextEditingController correoDir = TextEditingController();
  TextEditingController nombreApellCist = TextEditingController();
  TextEditingController telefCist = TextEditingController();
  TextEditingController dniCist = TextEditingController();
  TextEditingController correoCist = TextEditingController();

  void toNewFicha(String idIncide) {
    Get.rootDelegate.toNamed(Routes.newFicha(idIncide));
  }

  void saveIncidence() async {
    if (formKey.currentState!.validate()) {
      if (AuthService.to.userId != null) {
        _dialogLoading();
        final response = await _dataRepository.createIncidence(map: {
          'accion': 'createIncid',
          'id_user': AuthService.to.userId ?? '',
          'id_estado_incid': '1',
          'descripcion': descripcion.text,
          'inst_educ': nombreIE.text,
          'cod_modul': codigoMod.text,
          'cod_local': codigoLoc.text,
          'distrito': distrito.text,
          'provincia': provincia.text,
          'region': region.text,
          'dir_nomb_apell': nombreApellDir.text,
          'dir_telefono': telefDir.text,
          'dir_dni': dniDir.text,
          'dir_correo': correoDir.text,
          'cist_nomb_apell': nombreApellCist.text,
          'cist_telefono': telefCist.text,
          'cist_dni': dniCist.text,
          'cist_correo': correoCist.text,
        });
        Get.back();
        if (response != null) {
          if (!response.error) {
            descripcion.clear();
            nombreIE.clear();
            codigoMod.clear();
            codigoLoc.clear();
            distrito.clear();
            provincia.clear();
            region.clear();
            nombreApellDir.clear();
            telefDir.clear();
            dniDir.clear();
            correoDir.clear();
            nombreApellCist.clear();
            telefCist.clear();
            dniCist.clear();
            correoCist.clear();
            Get.rootDelegate.toNamed(Routes.newFicha(response.id.toString()));
          } else {
            _snackBar(Colors.red, 'ERROR', response.mensaje);
          }
        } else {
          _snackBar(Colors.red, 'ERROR', 'Error al crear incidencia');
        }
      } else {
        _snackBar(Colors.red, 'ERROR',
            'No tienes permisos para realizar esta acción');
      }
    }
  }

  String? isNotEmpty(String? text) {
    if (text != null) if (text.isNotEmpty) return null;
    return 'Ingrese datos';
  }

  void _dialogLoading() {
    Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 10,
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void _snackBar(Color color, String title, String body) {
    Get.snackbar(
      title,
      body,
      colorText: color,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      margin: const EdgeInsets.all(15),
    );
  }
}
