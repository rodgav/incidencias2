import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/services/auth_service.dart';
import 'package:incidencias2/app/routes/app_pages.dart';

import 'root_logic.dart';

class RootPage extends GetView<RootLogic> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, current) {
      debugPrint('title ${current?.location}');
      return Scaffold(
          body: GetRouterOutlet(
              initialRoute:
                  AuthService.to.isLoggedIn ? Routes.home : Routes.login));
    });
  }
}
