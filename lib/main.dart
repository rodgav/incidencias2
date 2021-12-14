import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:incidencias2/app/data/services/auth_service.dart';
import 'package:incidencias2/app/routes/app_pages.dart';
import 'package:incidencias2/app/utils/dependency_injection.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  await GetStorage.init();
  await initializeDateFormatting('es_ES');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        initialBinding: BindingsBuilder(() {
          Get.put(AuthService());
        }),
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Incidencias2',
        getPages: AppPages.routes);
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}
