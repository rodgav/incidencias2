import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/fichas_model.dart';
import 'package:incidencias2/app/data/models/incides_model.dart';
import 'package:incidencias2/app/data/models/response_model.dart';
import 'package:incidencias2/app/data/models/roles_model.dart';
import 'package:incidencias2/app/data/models/state_inci_model.dart';
import 'package:incidencias2/app/data/models/type_inci_model.dart';
import 'package:incidencias2/app/data/models/users_model.dart';

class DbProvider {
  final _dio = Get.find<Dio>();

  Future<UsersModel?> login(
      {required String user, required String password}) async {
    try {
      final result = await _dio.post('',
          data: {'accion': 'login', 'user': user, 'password': password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return UsersModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<TypeInciModel?> typeInci() async {
    try {
      final result =
          await _dio.get('', queryParameters: {'accion': 'typeInci'});
      return TypeInciModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<RolesModel?> roles() async {
    try {
      final result = await _dio.get('', queryParameters: {'accion': 'roles'});
      return RolesModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<StateInciModel?> stateInci() async {
    try {
      final result =
          await _dio.get('', queryParameters: {'accion': 'stateInci'});
      return StateInciModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<IncidencesModel?> getIncidences({required Map<String, String> map}) async {
    try {
      final result = await _dio.get('', queryParameters: map);
      return IncidencesModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<IncidencesModel?> getIncidId({required String idIncid}) async {
    try {
      final result = await _dio
          .get('', queryParameters: {'accion': 'incide', 'idIncid': idIncid});
      return IncidencesModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<FichasModel?> getFichas({required String idIncid}) async {
    try {
      final result = await _dio
          .get('', queryParameters: {'accion': 'fichas', 'idIncid': idIncid});
      return FichasModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<UsersModel?> getUsers({required Map<String, String> map}) async {
    try {
      final result = await _dio.get('', queryParameters: map);
      return UsersModel.fromJson(result.data);
    } catch (_) {
      return null;
    }
  }

  Future<ResponseModel?> post({required Map<String, dynamic> map}) async {
    try {
      final response = await _dio.post('',
          data: map,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<ResponseModel?> put({required Map<String, dynamic> map}) async {
    try {
      final response = await _dio.put('',
          data: map,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<ResponseModel?> delete({required Map<String, dynamic> map}) async {
    try {
      final response = await _dio.delete('',
          data: map,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
