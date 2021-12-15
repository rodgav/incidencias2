import 'package:get/get.dart';
import 'package:incidencias2/app/data/middlewares/auth_middleware.dart';
import 'package:incidencias2/app/modules/home/home_binding.dart';
import 'package:incidencias2/app/modules/home/home_view.dart';
import 'package:incidencias2/app/modules/incidencias/incidencias_binding.dart';
import 'package:incidencias2/app/modules/incidencias/incidencias_view.dart';
import 'package:incidencias2/app/modules/incidencias_detail/incidencias_detail_binding.dart';
import 'package:incidencias2/app/modules/incidencias_detail/incidencias_detail_view.dart';
import 'package:incidencias2/app/modules/incidencias_pdf/incidencias_pdf_binding.dart';
import 'package:incidencias2/app/modules/incidencias_pdf/incidencias_pdf_view.dart';
import 'package:incidencias2/app/modules/login/login_binding.dart';
import 'package:incidencias2/app/modules/login/login_view.dart';
import 'package:incidencias2/app/modules/new_ficha/new_ficha_binding.dart';
import 'package:incidencias2/app/modules/new_ficha/new_ficha_view.dart';
import 'package:incidencias2/app/modules/new_incidencia/new_incidencia_binding.dart';
import 'package:incidencias2/app/modules/new_incidencia/new_incidencia_view.dart';
import 'package:incidencias2/app/modules/root/root_binding.dart';
import 'package:incidencias2/app/modules/root/root_view.dart';
import 'package:incidencias2/app/modules/usuarios/usuarios_binding.dart';
import 'package:incidencias2/app/modules/usuarios/usuarios_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;
  static final routes = [
    GetPage(
        name: '/',
        page: () => const RootPage(),
        binding: RootBinding(),
        participatesInRootNavigator: true,
        children: [
          GetPage(
              middlewares: [EnsureNotAuthMiddleware()],
              name: _Paths.login,
              page: () => const LoginPage(),
              binding: LoginBinding()),
          GetPage(
              middlewares: [EnsureAuthMiddleware()],
              name: _Paths.home,
              page: () => const HomePage(),
              binding: HomeBinding(),
              children: [
                GetPage(
                    name: _Paths.incidencias,
                    page: () => const IncidenciasPage(),
                    binding: IncidenciasBinding(),
                    children: [
                      GetPage(
                          name: _Paths.incidenciasDetails,
                          page: () => const IncidenciasDetailPage(),
                          binding: IncidenciasDetailBinding()),
                    ]),
                GetPage(
                    name: _Paths.incidenciasPDF,
                    page: () => const IncidenciasPdfPage(),
                    binding: IncidenciasPdfBinding()),
                GetPage(
                    name: _Paths.newIncidencia,
                    page: () => const NewIncidenciaPage(),
                    binding: NewIncidenciaBinding(),
                    children: [
                      GetPage(
                          name: _Paths.newFicha,
                          page: () => const NewFichaPage(),
                          binding: NewFichaBinding()),
                    ]),
                GetPage(
                    name: _Paths.users,
                    page: () => const UsuariosPage(),
                    binding: UsuariosBinding())
              ]),
        ])
  ];
}
