import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/type_inci_model.dart';
import 'package:incidencias2/app/data/repositorys/db_repository.dart';
import 'package:incidencias2/app/data/services/auth_service.dart';
import 'package:incidencias2/app/routes/app_pages.dart';

class NewFichaLogic extends GetxController {
  String idIncide;

  NewFichaLogic({required this.idIncide});

  final _dataRepository = Get.find<DbRepository>();
  final formKey = GlobalKey<FormState>();
  TextEditingController marca = TextEditingController();
  TextEditingController modelo = TextEditingController();
  TextEditingController serie = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController ubicacion = TextEditingController();
  TextEditingController observaciones = TextEditingController();
  TypeInciModel? _typeInciModel;
  TypeInci? _typeInci;

  TypeInciModel? get typeInciModel => _typeInciModel;

  TypeInci? get typeInci => _typeInci;

  @override
  void onReady() {
    getTypeInci();
    super.onReady();
  }

  void getTypeInci() async {
    _typeInciModel = await _dataRepository.typeInci();
    update(['typeInci']);
  }

  void selectTypeInci(TypeInci data) {
    _typeInci = data;
    update(['typeInci']);
  }

  void saveFicha() async {
    if (formKey.currentState!.validate()) {
      if (typeInci != null) {
        if (AuthService.to.userId != null) {
          _dialogLoading();
          final response = await _dataRepository.createIncidence(map: {
            'accion': 'createFicha',
            'id_incid': idIncide,
            'id_tipo_incid': typeInci!.id.toString(),
            'marca': marca.text,
            'modelo': modelo.text,
            'serie': serie.text,
            'estado': estado.text,
            'ubicacion': ubicacion.text,
            'observaciones': observaciones.text,
          });
          Get.back();
          if (response != null) {
            if (!response.error) {
              marca.clear();
              modelo.clear();
              serie.clear();
              estado.clear();
              ubicacion.clear();
              observaciones.clear();
            } else {
              _snackBar(Colors.red, 'ERROR', response.mensaje);
            }
          } else {
            _snackBar(
                Colors.red, 'ERROR', 'Error al crear la ficha de incidencia');
          }
        } else {
          _snackBar(Colors.red, 'ERROR',
              'No tienes permisos para realizar esta acción');
        }
      } else {
        _snackBar(Colors.red, 'ERROR', 'Seleccione un tipo de incidencia');
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

  void toIncides() {
    Get.rootDelegate.toNamed(Routes.incidencias);
  }
}
