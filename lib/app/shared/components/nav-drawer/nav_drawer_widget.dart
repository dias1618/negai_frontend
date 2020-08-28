import 'package:negai_frontend_main/app/shared/components/nav-drawer/components/drawer_header_component.dart';
import 'package:negai_frontend_main/app/shared/components/nav-drawer/components/drawer_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderComponent(),
          DrawerItemComponent(
            iconData: Icons.input,
            title: 'Principal',
            onTap: () => {
              Modular.to.pushNamed('/home')
            },
          ),
          DrawerItemComponent(
            iconData: Icons.verified_user,
            title: 'Perfil',
            onTap: () => {Navigator.of(context).pop()},
          ),
          DrawerItemComponent(
            iconData: Icons.settings,
            title: 'Configurações',
            onTap: () => {Navigator.of(context).pop()},
          ),
          DrawerItemComponent(
            iconData: Icons.exit_to_app,
            title: 'Logout',
            onTap: () => {
              Modular.to.popUntil(ModalRoute.withName('/'))
            },
          ),
        ],
      ),
    );
  }
}