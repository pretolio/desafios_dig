import 'package:desafios_dig/models/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomDrawerHeader extends StatelessWidget {
  bool action = false;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Consumer<UserManager>(builder: (_, userManage, __){
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Bem Vindo",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),

              Text("${userManage.usuario?.nome ?? ""}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

              GestureDetector(
                  onTap: (){
                    !userManage.userlooad ? Navigator.of(context).pushNamed("/login") : userManage.signOut();
                  },
                  child: Text(!userManage.userlooad ?  "Entre ou Cadastre-se" : "Sair",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 16, fontWeight: FontWeight.bold),)
              ),
          ]);
        })
    );
  }
}
