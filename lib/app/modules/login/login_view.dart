import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends GetView<LoginLogic> {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width > 800;
    return GestureDetector(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'INICIO DE SESIÓN',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: SizedBox(
                        width: web ? size.width * 0.5 : size.width * 0.9,
                        child: const Text(
                          'Correo',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Center(
                      child: SizedBox(
                          width: web ? size.width * 0.5 : size.width * 0.9,
                          child: TextFormField(
                            controller: controller.emailCtrl,
                            validator: (value) => controller.validateEmail(value),
                            decoration: InputDecoration(
                                hintText: 'Correo',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.red))),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: web ? size.width * 0.5 : size.width * 0.9,
                        child: const Text(
                          'Contraseña',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Center(
                      child: SizedBox(
                          width: web ? size.width * 0.5 : size.width * 0.9,
                          child: TextFormField(
                            controller: controller.passCtrl,
                            validator: (value) => controller.isNotEmpty(value),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Contraseña',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    const BorderSide(color: Colors.red))),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                          onPressed: controller.login,
                          child: const Text('Iniciar sesión')),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () => FocusScope.of(context).unfocus());
  }
}
