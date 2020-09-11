import 'package:flutter/material.dart';
import 'custom_drawer_header.dart';
import 'drawer_tile.dart';


class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                ])
            ),
          ),
          ListView( children: [
              CustomDrawerHeader(),
              DrawerTile(icon: Icons.home, title: "Inicio", page: 0,),
              DrawerTile(icon: Icons.list, title: "Produtos", page: 1,),
              DrawerTile(icon: Icons.playlist_add_check, title: "Meus Pedidos", page: 2,),
              DrawerTile(icon: Icons.location_on, title: "Lojas", page: 3,),
            ],
          ),
        ]
      ),
    );
  }
}
