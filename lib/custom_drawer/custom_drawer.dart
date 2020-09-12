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
                  Colors.indigo[50],
                  Colors.white,
                  Colors.white,
                  Colors.indigo[100],
                ])
            ),
          ),
          ListView( children: [
              CustomDrawerHeader(),
              DrawerTile(icon: Icons.format_list_numbered, title: "Ordenar Numeros", page: 0,),
              DrawerTile(icon: Icons.developer_board, title: "Binarios", page: 1,),
            ],
          ),
        ]
      ),
    );
  }
}
