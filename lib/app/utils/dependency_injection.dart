import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/providers/db_provider.dart';
import 'package:incidencias2/app/data/repositorys/db_repository.dart';
import 'package:incidencias2/app/utils/encrypt_helper.dart';

class DependencyInjection {
  static void init() {
    Get.put<EncryptHelper>(EncryptHelper());
    Get.put<Dio>(Dio(BaseOptions(
        baseUrl: 'http://192.168.0.107/api_incidencias2/v1/',
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        },
        headers: {'token': '112dasd35gfsdq324dfxmhg643FGSD34213fdsf234DS'},
        connectTimeout: 5000,
        receiveTimeout: 5000)));
    Get.put<DbProvider>(DbProvider());
    Get.put<DbRepository>(DbRepository());
  }
}
