import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'incidencias_detail_logic.dart';

class IncidenciasDetailPage extends GetView<IncidenciasDetailLogic> {
  const IncidenciasDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final web = size.width > 800;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: web ? 80 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Incidente',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GetBuilder<IncidenciasDetailLogic>(
                id: 'incidencia',
                builder: (_) {
                  final incidencesModel = controller.incidencesModel;
                  return incidencesModel != null &&
                          incidencesModel.incides.isNotEmpty
                      ? Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Container(
                              width: web ? size.width * 0.3 : size.width * 0.94,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.blue)),
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Datos de incidencia\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: '\nDescripción: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].descripcion),
                                    TextSpan(
                                        text: '\nUsuario: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text:
                                            incidencesModel.incides[0].usuario),
                                  ])),
                                ),
                              ),
                            ),
                            Container(
                              width: web ? size.width * 0.3 : size.width * 0.94,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.blue)),
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Datos de la institución educativa\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: '\nNombre de la IE: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].instEduc),
                                    TextSpan(
                                        text: '\nCódigo modular: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].codModul),
                                    TextSpan(
                                        text: '\nCódigo local: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].codLocal),
                                    TextSpan(
                                        text: '\nDistrito: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].distrito),
                                    TextSpan(
                                        text: '\nProvincia: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].provincia),
                                    TextSpan(
                                        text: '\nRegión: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text:
                                            incidencesModel.incides[0].region),
                                  ])),
                                ),
                              ),
                            ),
                            Container(
                              width: web ? size.width * 0.3 : size.width * 0.94,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.blue)),
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Datos del CIST/CARE\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: '\nNombres y apellidos CIST: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].cistNombApell),
                                    TextSpan(
                                        text: '\nTeléfono CIST: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].cistTelefono),
                                    TextSpan(
                                        text: '\nDNI CIST: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text:
                                            incidencesModel.incides[0].cistDni),
                                    TextSpan(
                                        text: '\nCorreo CIST: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].cistCorreo),
                                  ])),
                                ),
                              ),
                            ),
                            Container(
                              width: web ? size.width * 0.3 : size.width * 0.94,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.blue)),
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Datos del director\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text:
                                            '\nNombres y apellidos director: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].dirNombApell),
                                    TextSpan(
                                        text: '\nTeléfono director: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].dirTelefono),
                                    TextSpan(
                                        text: '\nDNI director: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text:
                                            incidencesModel.incides[0].dirDni),
                                    TextSpan(
                                        text: '\nCorreo director: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                    TextSpan(
                                        text: incidencesModel
                                            .incides[0].dirCorreo),
                                  ])),
                                ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox();
                }),
            const SizedBox(height: 20),
            Text(
              'Fichas',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            GetBuilder<IncidenciasDetailLogic>(
                id: 'fichas',
                builder: (_) {
                  final fichasModel = controller.fichasModel;
                  return fichasModel != null && fichasModel.fichas.isNotEmpty
                      ? DataTable(
                          columns: const [
                              DataColumn(
                                  label: Text(
                                'Tipo de incidente',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                              DataColumn(
                                  label: Text(
                                'Marca',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                              DataColumn(
                                  label: Text(
                                'Modelo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                              DataColumn(
                                  label: Text(
                                'Serie',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                              DataColumn(
                                  label: Text(
                                'Estado',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                              DataColumn(
                                  label: Text(
                                'Ubicación',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                              DataColumn(
                                  label: Text(
                                'Observaciones',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                              )),
                            ],
                          rows: fichasModel.fichas
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(
                                      e.name,
                                      maxLines: 2,
                                    )),
                                    DataCell(Text(
                                      e.marca,
                                      maxLines: 2,
                                    )),
                                    DataCell(Text(
                                      e.modelo,
                                      maxLines: 2,
                                    )),
                                    DataCell(Text(
                                      e.serie,
                                      maxLines: 2,
                                    )),
                                    DataCell(Text(
                                      e.estado,
                                      maxLines: 2,
                                    )),
                                    DataCell(Text(
                                      e.ubicacion,
                                      maxLines: 2,
                                    )),
                                    DataCell(Text(
                                      e.observaciones,
                                      maxLines: 2,
                                    )),
                                  ]))
                              .toList())
                      : const SizedBox();
                }),
          ],
        ),
      ),
    );
  }
}
