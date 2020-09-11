import 'package:desafios_dig/models/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomDrawerHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Consumer<UserManager>(builder: (_, userManage, __){
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Loja GM", maxLines: 2, style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),

              Text("Olá, ${userManage.usuario?.nome ?? ""}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

              GestureDetector(
                onTap: (){
                  userManage.load ? userManage.signOut() : Navigator.of(context).pushNamed("/login");
                },
                child: Text(userManage.load ? "Sair" : "Entre ou Cadastre-se",
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 16, fontWeight: FontWeight.bold),)
              ),
          ]);
        })
    );
  }
}
