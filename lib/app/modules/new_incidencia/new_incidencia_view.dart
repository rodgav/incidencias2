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
    return  SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 20, horizontal: web ? 80 : 20),
          child: Form(
            key: controller.formKey,
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
                FormFieldIncidencia(
                    controller: controller.descripcion,
                    validator: controller.isNotEmpty,
                    label: 'Descripción',
                    hintText: 'Descripción',
                    maxLines: 5),
                const SizedBox(height: 20),
                Text(
                  'Datos de la institución educativa',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                FormFieldIncidencia(
                    controller: controller.nombreIE,
                    validator: controller.isNotEmpty,
                    label: 'Nombre de la IE',
                    hintText: 'Nombre de la IE',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.codigoMod,
                    validator: controller.isNotEmpty,
                    label: 'Código modular',
                    hintText: 'Código modular',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.codigoLoc,
                    validator: controller.isNotEmpty,
                    label: 'Código local',
                    hintText: 'Código local',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.distrito,
                    validator: controller.isNotEmpty,
                    label: 'Distrito',
                    hintText: 'Distrito',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.provincia,
                    validator: controller.isNotEmpty,
                    label: 'Provincia',
                    hintText: 'Provincia',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.region,
                    validator: controller.isNotEmpty,
                    label: 'Región',
                    hintText: 'Región',
                    maxLines: 1),
                const SizedBox(height: 20),
                Text(
                  'Datos del director',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                FormFieldIncidencia(
                    controller: controller.nombreApellDir,
                    validator: controller.isNotEmpty,
                    label: 'Nombres y apellidos',
                    hintText: 'Nombres y apellidos',
                    maxLines: 2),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.telefDir,
                    validator: controller.isNotEmpty,
                    label: 'Teléfono',
                    hintText: 'Teléfono',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.dniDir,
                    validator: controller.isNotEmpty,
                    label: 'DNI',
                    hintText: 'DNI',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.correoDir,
                    validator: controller.isNotEmpty,
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
                FormFieldIncidencia(
                    controller: controller.nombreApellCist,
                    validator: controller.isNotEmpty,
                    label: 'Nombres y apellidos',
                    hintText: 'Nombres y apellidos',
                    maxLines: 2),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.telefCist,
                    validator: controller.isNotEmpty,
                    label: 'Teléfono',
                    hintText: 'Teléfono',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.dniCist,
                    validator: controller.isNotEmpty,
                    label: 'DNI',
                    hintText: 'DNI',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.correoCist,
                    validator: controller.isNotEmpty,
                    label: 'Correo electrónico',
                    hintText: 'Correo electrónico',
                    maxLines: 1),
                const SizedBox(height: 20),
                Center(
                    child: SizedBox(
                  width: size.width * 0.15,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: controller.saveIncidence,
                      child: const Text(
                        'Crear',
                        style: TextStyle(fontSize: 20),
                      )),
                ))
              ],
            ),
          ),
        ),
      );
  }
}
