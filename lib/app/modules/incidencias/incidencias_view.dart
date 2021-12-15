import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'incidencias_logic.dart';

class IncidenciasPage extends GetView<IncidenciasLogic> {
  const IncidenciasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width > 800;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Incidentes',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Estados de incidentes',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 5),
        GetBuilder<IncidenciasLogic>(
            id: 'stateInci',
            builder: (_) {
              final stateInciModel = _.stateInciModel;
              final stateInci = _.stateInci;
              return SizedBox(
                height: 40,
                child: stateInciModel != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (__, index) {
                          final data = stateInciModel.stateInci[index];
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: data == stateInci
                                        ? Colors.blue
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.blue)),
                                margin: const EdgeInsets.only(left: 20),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(data.name,
                                        style: TextStyle(
                                            color: data == stateInci
                                                ? Colors.white
                                                : Colors.blue))),
                              ),
                              onTap: () => _.selectTypeInci(data),
                            ),
                          );
                        },
                        itemCount: stateInciModel.stateInci.length)
                    : const Text('Tareas no encontradas'),
              );
            }),
        const Divider(),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16)),
                onPressed: () => controller.toNewIncid(),
                icon: const Icon(Icons.add),
                label: const Text('Nuevo')),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
            child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<IncidenciasLogic>(
                id: 'incidences',
                builder: (_) {
                  final incidencesModel = _.incidencesModel;
                  return web
                      ? incidencesModel != null
                          ? incidencesModel.incides.isNotEmpty
                              ? SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: DataTable(
                                    columns: const [
                                      DataColumn(
                                          label: Text(
                                        'Número',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Institución Educativa',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),DataColumn(
                                          label: Text(
                                        'Usuario',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Descripción',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'PDF',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Acciones',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                    ],
                                    rows: incidencesModel.incides.map((e) {
                                      final index =
                                          incidencesModel.incides.indexOf(e);
                                      return DataRow(cells: [
                                        DataCell(Text('$index')),
                                        DataCell(Text(e.instEduc)),
                                        DataCell(Text(e.usuario)),
                                        DataCell(Text(e.descripcion,maxLines: 2,)),
                                        DataCell(TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                textStyle: const TextStyle(
                                                    color: Colors.white)),
                                            onPressed: () => controller
                                                .popupSelect(e.idInci, 'pdf'),
                                            child: const Text(
                                              'PDF',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                        DataCell(PopupMenuButton<String>(
                                          itemBuilder: (_) => [
                                           /* const PopupMenuItem(
                                                child: Text('Eliminar'),
                                                value: 'delete'),*/
                                            const PopupMenuItem(
                                                child: Text('Detalles'),
                                                value: 'detail'),
                                          ],
                                          onSelected: (value) => controller
                                              .popupSelect(e.idInci, value),
                                        )),
                                      ]);
                                    }).toList(),
                                  ),
                                )
                              : const Center(
                                  child: Text('No hay datos'),
                                )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )
                      : incidencesModel != null
                          ? incidencesModel.incides.isNotEmpty
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final incidence =
                                        incidencesModel.incides[index];
                                    return ListTile(
                                        leading: CircleAvatar(
                                          child: Text(index.toString()),
                                        ),
                                        title: Text(
                                            incidence.instEduc),
                                        subtitle: Text(
                                          incidence.descripcion,
                                          maxLines: 2,
                                        ),
                                        trailing: PopupMenuButton<String>(
                                          itemBuilder: (_) => [
                                            const PopupMenuItem(
                                                child: Text('PDF'),
                                                value: 'pdf'),
                                         /*   const PopupMenuItem(
                                                child: Text('Eliminar'),
                                                value: 'delete'),*/
                                            const PopupMenuItem(
                                                child: Text('Detalles'),
                                                value: 'detail'),
                                          ],
                                          onSelected: (value) => controller
                                              .popupSelect(incidence.idInci, value),
                                        ));
                                  },
                                  itemCount: incidencesModel.incides.length,
                                )
                              : const Center(
                                  child: Text('No hay datos'),
                                )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                }),
          ),
        ))
      ],
    );
  }
}
