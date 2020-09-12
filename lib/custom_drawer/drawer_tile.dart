import 'package:desafios_dig/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final int page;

  DrawerTile({this.title, this.icon, this.page});

  @override
  Widget build(BuildContext context) {
    final int pageAtual = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;


    return InkWell(
      onTap: (){
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(height: 60,
        child: Row(children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Icon(icon, size: 32,
              color: pageAtual == page ? primaryColor : Colors.grey[400],
            ),
          ),
          Text(title, style: TextStyle(fontSize: 16,
              color: pageAtual == page ? primaryColor : Colors.grey[400]),
          )
        ],),
      ),
    );
  }
}
