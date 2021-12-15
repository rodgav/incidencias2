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
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            GetBuilder<IncidenciasDetailLogic>(
                id: 'incidencia',
                builder: (_) {
                  final incidencesModel = controller.incidencesModel;
                  print(incidencesModel?.incides);
                  return incidencesModel != null &&
                          incidencesModel.incides.isNotEmpty
                      ? RichText(
                          text: TextSpan(children: [
                          TextSpan(
                              text: '\nUsuario: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                          TextSpan(text: incidencesModel.incides[0].usuario),
                          TextSpan(
                              text: '\nDescripción: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                          TextSpan(
                              text: incidencesModel.incides[0].descripcion),
                        ]))
                      : const SizedBox();
                }),
            const SizedBox(height: 20),
            Text(
              'Fichas',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
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
                                      e.idTipoIncid.toString(),
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
