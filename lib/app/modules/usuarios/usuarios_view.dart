import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'usuarios_logic.dart';

class UsuariosPage extends GetView<UsuariosLogic> {
  const UsuariosPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width > 1000;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Usuarios',
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
              'Tipos de usuarios',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 5),
        GetBuilder<UsuariosLogic>(
            id: 'roles',
            builder: (_) {
              final rolesModel = _.rolesModel;
              final role = _.role;
              return SizedBox(
                height: 40,
                child: rolesModel != null
                    ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (__, index) {
                      final data = rolesModel.roles[index];
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                color: data == role
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blue)),
                            margin: const EdgeInsets.only(left: 20),
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    data.name == 'admin'
                                        ? 'Administrador'
                                        : data.name == 'Todos'
                                        ? 'Todos'
                                        : 'Usuario',
                                    style: TextStyle(
                                        color: data == role
                                            ? Colors.white
                                            : Colors.blue))),
                          ),
                          onTap: () => _.selectRoles(data),
                        ),
                      );
                    },
                    itemCount: rolesModel.roles.length)
                    : const Text('Tipos de usuarios  no encontrados'),
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
                onPressed: () => controller.newUser('new'),
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
                child: GetBuilder<UsuariosLogic>(
                    id: 'users',
                    builder: (_) {
                      final usersModel = _.usersModel;
                      return web
                          ? usersModel != null
                          ? usersModel.users.isNotEmpty
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
                                  'Apellidos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            DataColumn(
                                label: Text(
                                  'Nombres',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            DataColumn(
                                label: Text(
                                  'Teléfono',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            DataColumn(
                                label: Text(
                                  'Correo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            DataColumn(
                                label: Text(
                                  'Rol',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            DataColumn(
                                label: Text(
                                  'Estado',
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
                          rows: usersModel.users.map((e) {
                            final index = usersModel.users.indexOf(e);
                            return DataRow(cells: [
                              DataCell(Text('$index')),
                              DataCell(Text(e.lastName)),
                              DataCell(Text(e.name)),
                              DataCell(Text(e.phone)),
                              DataCell(Text(e.user)),
                              DataCell(Text(e.role)),
                              DataCell(Text(
                                e.active == 1 ? 'Activo' : 'Inactivo',
                                style: TextStyle(
                                    color: e.active == 1
                                        ? Colors.green
                                        : Colors.red),
                              )),
                              DataCell(PopupMenuButton<String>(
                                itemBuilder: (_) => [
                                  const PopupMenuItem(
                                      child: Text('Editar'),
                                      value: 'edit'),
                                ],
                                onSelected: (value) =>
                                    controller.selPopup(value, e),
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
                          : usersModel != null
                          ? usersModel.users.isNotEmpty
                          ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          final user = usersModel.users[index];
                          return ListTile(
                              leading: CircleAvatar(
                                child: Text(index.toString()),
                              ),
                              title: Text(
                                  '${user.lastName} ${user.name}'),
                              subtitle: Text(user.user),
                              trailing: PopupMenuButton<String>(
                                itemBuilder: (_) => [
                                  const PopupMenuItem(
                                      child: Text('Editar'),
                                      value: 'edit'),
                                ],
                                onSelected: (value) =>
                                    controller.selPopup(value, user),
                              ));
                        },
                        itemCount: usersModel.users.length,
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
