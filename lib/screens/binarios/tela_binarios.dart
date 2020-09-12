import 'package:desafios_dig/custom_drawer/custom_drawer.dart';
import 'package:desafios_dig/models/numeros_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Binarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text("Binarios"), centerTitle: true,),
      body: Consumer<NumerosManager>(
          builder: (context, produtosManager, __){
            return GridView.builder(
                itemCount: produtosManager.listNumeros.length,
                padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index){
                    return Card();
                }
            );
          }
      ),
    );
  }
}
