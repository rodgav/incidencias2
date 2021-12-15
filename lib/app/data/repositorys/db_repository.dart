import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/fichas_model.dart';
import 'package:incidencias2/app/data/models/incides_model.dart';
import 'package:incidencias2/app/data/models/response_model.dart';
import 'package:incidencias2/app/data/models/roles_model.dart';
import 'package:incidencias2/app/data/models/state_inci_model.dart';
import 'package:incidencias2/app/data/models/type_inci_model.dart';
import 'package:incidencias2/app/data/models/users_model.dart';
import 'package:incidencias2/app/data/providers/db_provider.dart';

class DbRepository {
  final _dbProvider = Get.find<DbProvider>();

  Future<UsersModel?> login({required String user, required String password}) =>
      _dbProvider.login(user: user, password: password);

  Future<TypeInciModel?> typeInci() => _dbProvider.typeInci();

  Future<StateInciModel?> stateInci() => _dbProvider.stateInci();

  Future<ResponseModel?> createIncidence({required Map<String, String> map}) =>
      _dbProvider.post(map: map);

  Future<IncidencesModel?> getIncidences({required Map<String, String> map}) => _dbProvider.getIncidences(map:map);

  Future<IncidencesModel?> getIncidId({required String idIncid}) =>
      _dbProvider.getIncidId(idIncid: idIncid);

  Future<ResponseModel?> deleteInci({required Map<String, String> map}) =>
      _dbProvider.delete(map: map);

  Future<FichasModel?> getFichas({required String idIncid}) =>
      _dbProvider.getFichas(idIncid: idIncid);

  Future<UsersModel?> getUsers({required Map<String, String> map}) =>
      _dbProvider.getUsers(map:map);

  Future<RolesModel?> roles() => _dbProvider.roles();

  Future<ResponseModel?> updaPassw({required Map<String, String> map}) =>
      _dbProvider.put(map: map);

  Future<ResponseModel?> updaRole({required Map<String, String> map}) =>
      _dbProvider.put(map: map);

  Future<ResponseModel?> createUser({required Map<String, String> map}) =>
      _dbProvider.post(map: map);

  Future<ResponseModel?> updaUser({required Map<String, String> map}) =>
      _dbProvider.put(map: map);
}
