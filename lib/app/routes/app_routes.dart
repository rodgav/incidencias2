part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const login = _Paths.login;

  static String loginThen(String afterSuccessFullLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessFullLogin)}';
  static const home = _Paths.home;

  static const incidencias = home + _Paths.incidencias;
  static const newIncidencia = home + _Paths.newIncidencia;
  static String newFicha(String idIncide) => '$newIncidencia/$idIncide';

  static String incidenciasDetails(String idIncide) => '$incidencias/$idIncide';
  static String incidenciasPDF(String idIncide) => '$home/incidenciasPdf/$idIncide';

  static const users = home + _Paths.users;

  static String adminThen(String afterSuccessFullLogin) =>
      '$home?then=${Uri.encodeQueryComponent(afterSuccessFullLogin)}';
}

abstract class _Paths {
  static const login = '/login';
  static const home = '/home';
  static const incidencias = '/incidencias';
  static const newIncidencia = '/newIncidencia';
  static const newFicha = '/:idIncide';
  static const incidenciasDetails = '/:idIncide';
  static const incidenciasPDF = '/incidenciasPdf/:idIncide';
  static const users = '/users';
}
