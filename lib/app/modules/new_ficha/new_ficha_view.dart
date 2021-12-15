import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/type_inci_model.dart';
import 'package:incidencias2/app/global_widgets/form_field_incidencia.dart';

import 'new_ficha_logic.dart';

class NewFichaPage extends GetView<NewFichaLogic> {
  const NewFichaPage({Key? key}) : super(key: key);

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
                    'Nueva Ficha de incidencia',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Ficha de registro de fallas tecnológicas',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                GetBuilder<NewFichaLogic>(
                    id: 'typeInci',
                    builder: (_) {
                      final typeInciModel = controller.typeInciModel;
                      final typeInci = controller.typeInci;
                      return typeInciModel != null
                          ? Container(
                              color: Colors.white,
                              child: DropdownButtonFormField<TypeInci>(
                                isExpanded: true,
                                value: typeInci,
                                items: typeInciModel.typeInci
                                    .map((e) => DropdownMenuItem<TypeInci>(
                                        value: e, child: Text(e.name)))
                                    .toList(),
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    label: const Text('Tipo de incidente'),
                                    hintText: 'Tipo de incidente',
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onChanged: (value) =>
                                    controller.selectTypeInci(value as TypeInci),
                              ),
                            )
                          : const SizedBox();
                    }),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.marca,
                    validator: controller.isNotEmpty,
                    label: 'Marca',
                    hintText: 'Marca',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.modelo, validator: controller.isNotEmpty,
                    label: 'Modelo',
                    hintText: 'Modelo',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.serie, validator: controller.isNotEmpty,
                    label: '# de serie',
                    hintText: '# de serie',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.estado, validator: controller.isNotEmpty,
                    label: 'Estado',
                    hintText: 'Estado',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.ubicacion, validator: controller.isNotEmpty,
                    label: 'Ubicación',
                    hintText: 'Ubicación',
                    maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    controller: controller.observaciones, validator: controller.isNotEmpty,
                    label: 'Observaciones/desperfecto',
                    hintText: 'Observaciones/desperfecto',
                    maxLines: 3),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: size.width * 0.15,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: controller.saveFicha,
                          child: const Text(
                            'Crear',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.15,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: controller.toIncides,
                          child: const Text(
                            'Finalizar',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
