import 'package:desafios_dig/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final int pageAtual = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;


    return BottomNavigationBar(
        fixedColor: primaryColor,
        currentIndex: pageAtual,
        onTap: (indice){
          context.read<PageManager>().setPage(indice);
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Ordenar Numeros"),
            icon: Icon(Icons.format_list_numbered),
          ),
          BottomNavigationBarItem(
            title: Text("Binarios"),
            icon: Icon(Icons.developer_board),
          ),
        ]
    );
  }
}