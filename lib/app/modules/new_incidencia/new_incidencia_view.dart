import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/global_widgets/form_field_incidencia.dart';

import 'new_incidencia_logic.dart';

class NewIncidenciaPage extends GetView<NewIncidenciaLogic> {
  const NewIncidenciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final web = size.width > 800;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 20, horizontal: web ? 80 : 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Nueva incidencia',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Datos de incidencia',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const FormFieldIncidencia(
                    label: 'Descripción', hintText: 'Descripción', maxLines: 5),
                const SizedBox(height: 20),
                Text(
                  'Datos de la institución educativa',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const FormFieldIncidencia(
                    label: 'Nombre de la IE',
                    hintText: 'Nombre de la IE',
                    maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Código modular',
                    hintText: 'Código modular',
                    maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Nombre de la IE',
                    hintText: 'Nombre de la IE',
                    maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Código local',
                    hintText: 'Código local',
                    maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Distrito', hintText: 'Distrito', maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Provincia', hintText: 'Provincia', maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Región', hintText: 'Región', maxLines: 1),
                const SizedBox(height: 20),
                Text(
                  'Datos del director',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const FormFieldIncidencia(
                    label: 'Nombres y apellidos',
                    hintText: 'Nombres y apellidos',
                    maxLines: 2),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Teléfono', hintText: 'Teléfono', maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'DNI', hintText: 'DNI', maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Correo electrónico',
                    hintText: 'Correo electrónico',
                    maxLines: 1),
                const SizedBox(height: 15),
                Text(
                  'Datos del CIST/CARE',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const FormFieldIncidencia(
                    label: 'Nombres y apellidos',
                    hintText: 'Nombres y apellidos',
                    maxLines: 2),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Teléfono', hintText: 'Teléfono', maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'DNI', hintText: 'DNI', maxLines: 1),
                const SizedBox(height: 10),
                const FormFieldIncidencia(
                    label: 'Correo electrónico',
                    hintText: 'Correo electrónico',
                    maxLines: 1),
                const SizedBox(height: 20),
                Center(
                    child: SizedBox(
                  width: size.width * 0.15,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: controller.toNewFicha,
                      child: const Text(
                        'Crear',
                        style: TextStyle(fontSize: 20),
                      )),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
