import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/global_widgets/drop_button_incidencia.dart';
import 'package:incidencias2/app/global_widgets/form_field_incidencia.dart';

import 'new_ficha_logic.dart';

class NewFichaPage extends GetView<NewFichaLogic> {
  const NewFichaPage({Key? key}) : super(key: key);

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
                const DropButtonIncidencia(label: 'Tipo', hintText: 'Tipo'),
                const SizedBox(height: 10),
                const  FormFieldIncidencia(
                    label: 'Marca', hintText: 'Marca', maxLines: 1),
                const SizedBox(height: 10),
                const  FormFieldIncidencia(
                    label: 'Modelo', hintText: 'Modelo', maxLines: 1),
                const SizedBox(height: 10),
                const  FormFieldIncidencia(
                    label: '# de serie', hintText: '# de serie', maxLines: 1),
                const SizedBox(height: 10),
                const  FormFieldIncidencia(
                    label: 'Estado', hintText: 'Estado', maxLines: 1),
                const SizedBox(height: 10),
                const DropButtonIncidencia(label: 'Estado', hintText: 'Estado'),
                const SizedBox(height: 10),
                const  FormFieldIncidencia(
                    label: 'Ubicación', hintText: 'Ubicación', maxLines: 1),
                const SizedBox(height: 10),
                const  FormFieldIncidencia(
                    label: 'Observaciones/desperfecto',
                    hintText: 'Observaciones/desperfecto',
                    maxLines: 3),
                const SizedBox(height: 10),
                const  SizedBox(height: 20),
                Center(
                    child: SizedBox(
                  width: size.width * 0.15,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () => null,
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
