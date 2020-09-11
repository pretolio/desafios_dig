import 'package:desafios_dig/custom_drawer/custom_drawer.dart';
import 'package:desafios_dig/models/numeros_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TelaProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text("Produtos"), centerTitle: true,),
      body: Consumer<ProdutosManager>(
          builder: (context, produtosManager, __){
            return GridView.builder(
                itemCount: produtosManager.produtos.length,
                padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index){
                    return Card(
                      child: Padding(padding: EdgeInsets.all(4),
                        child: GridTile(
                          header: Text(produtosManager.produtos[index].nome, textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          footer: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("A partir de  ", style: TextStyle(color: Colors.grey),),
                              Text("R\$ 39,90", style: TextStyle(fontSize: 18,
                                  color: Colors.indigo, fontWeight: FontWeight.bold),),
                          ]),
                          child: Padding(padding: EdgeInsets.all(28),
                              child: Image.network(produtosManager.produtos[index].img.first)
                          ),
                        ),
                      ),
                    );
                }
            );
          }
      ),
    );
  }
}
