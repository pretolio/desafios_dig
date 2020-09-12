import 'package:desafios_dig/models/numeros_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumOrdenado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3, width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,)
      ),
      child: Center(
        child: Consumer<NumerosManager>(
            builder: (context, produtosManager, __){
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: produtosManager.listNumeros.length,
                itemBuilder: (contex, indice){
                  return Text( "${produtosManager.listNumeros[indice]}" , textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  );
                }
              );
            }
        ),
      ),
    );
  }
}
