import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incidencias2/app/global_widgets/drop_button_incidencia.dart';
import 'package:incidencias2/app/global_widgets/form_field_incidencia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewFichas());
  }
}

class NewIncidencia extends StatelessWidget {
  const NewIncidencia({Key? key}) : super(key: key);

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
                Text(
                  'Datos de incidencia',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                FormFieldIncidencia(
                    label: 'Descripción', hintText: 'Descripción', maxLines: 5),
                SizedBox(height: 20),
                Text(
                  'Datos de la institución educativa',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                FormFieldIncidencia(
                    label: 'Nombre de la IE',
                    hintText: 'Nombre de la IE',
                    maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Código modular',
                    hintText: 'Código modular',
                    maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Nombre de la IE',
                    hintText: 'Nombre de la IE',
                    maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Código local',
                    hintText: 'Código local',
                    maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Distrito', hintText: 'Distrito', maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Provincia', hintText: 'Provincia', maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Región', hintText: 'Región', maxLines: 1),
                SizedBox(height: 20),
                Text(
                  'Datos del director',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                FormFieldIncidencia(
                    label: 'Nombres y apellidos',
                    hintText: 'Nombres y apellidos',
                    maxLines: 2),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Teléfono', hintText: 'Teléfono', maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(label: 'DNI', hintText: 'DNI', maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Correo electrónico',
                    hintText: 'Correo electrónico',
                    maxLines: 1),
                SizedBox(height: 15),
                Text(
                  'Datos del CIST/CARE',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                FormFieldIncidencia(
                    label: 'Nombres y apellidos',
                    hintText: 'Nombres y apellidos',
                    maxLines: 2),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Teléfono', hintText: 'Teléfono', maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(label: 'DNI', hintText: 'DNI', maxLines: 1),
                SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Correo electrónico',
                    hintText: 'Correo electrónico',
                    maxLines: 1),
                SizedBox(height: 20),
                Center(
                    child: Container(
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

class NewFichas extends StatelessWidget {
  const NewFichas({Key? key}) : super(key: key);

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
                FormFieldIncidencia(
                    label: 'Marca', hintText: 'Marca', maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Modelo', hintText: 'Modelo', maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    label: '# de serie', hintText: '# de serie', maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Estado', hintText: 'Estado', maxLines: 1),
                const SizedBox(height: 10),
                const DropButtonIncidencia(label: 'Estado', hintText: 'Estado'),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Ubicación', hintText: 'Ubicación', maxLines: 1),
                const SizedBox(height: 10),
                FormFieldIncidencia(
                    label: 'Observaciones/desperfecto',
                    hintText: 'Observaciones/desperfecto',
                    maxLines: 3),
                const SizedBox(height: 10),
                SizedBox(height: 20),
                Center(
                    child: Container(
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
