import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/incides_model.dart';
import 'package:incidencias2/app/data/models/type_inci_model.dart';
import 'package:incidencias2/app/data/repositorys/db_repository.dart';
import 'package:incidencias2/app/routes/app_pages.dart';

class IncidenciasLogic extends GetxController {
  final _dataRepository = Get.find<DbRepository>();
  TypeInciModel? _typeInciModel;
  TypeInci? _typeInci;
  IncidencesModel? _incidencesModel;

  TypeInciModel? get typeInciModel => _typeInciModel;

  TypeInci? get typeInci => _typeInci;

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
    _typeInciModel = await _dataRepository.typeInci();
    if (typeInciModel != null) {
      _typeInciModel!.typeInci.insert(0, TypeInci(id: 0, name: 'Todos'));
      _typeInci = typeInciModel!.typeInci[0];
      update(['typeIncis']);
      _getIncids(typeInci!.id);
    }
  }

  void _getIncids(int idTypeInci) async {
    _incidencesModel = await _dataRepository.getIncidences();
    update(['incidences']);
  }

  void selectTypeInci(TypeInci data) {
    _typeInci = data;
    update(['typeIncis']);
    _getIncids(data.id);
  }

  void toNewIncid() {
    Get.rootDelegate.toNamed(Routes.newIncidencia);
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
