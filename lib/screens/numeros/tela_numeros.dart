import 'package:desafios_dig/custom_drawer/custom_drawer.dart';
import 'package:desafios_dig/models/numeros_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ordenada_numeros.dart';

class NumerosInteiros extends StatelessWidget {
  TextEditingController ncontroller = TextEditingController();
  TextEditingController kcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text("Ordenar Numeros"), centerTitle: true,),
      body: SingleChildScrollView(padding: EdgeInsets.only(top: 35, left: 35, right: 35),
        child: Form(key: formkey,
          child: Column(
              children: [
                TextFormField(
                  controller: ncontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      helperText: "Digite um numero de 1 até 1000.",
                      hintText: "ex: 1"
                  ),
                  validator: (n){
                    if(n.isEmpty){
                      return 'Campo Obrigatório';
                    }else if(int.parse(n) < 1 || int.parse(n) > 1000 ){
                      return 'Os numeros deve esta entre 1 e 1000';
                    }else if(n.trim().split(" ").length > 1
                        || n.trim().split(",").length > 1
                        || n.trim().split(".").length > 1
                        || n.trim().split("-").length > 1){
                      return 'Digite numeros inteiros';
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: kcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      helperText: "Digite um numeros entre -1000 e 1000 separando por virgulas.",
                      hintText: "ex: -1000, 1000, 23, -40"
                  ),
                  validator: (k){
                    try{
                      if(k.isEmpty){
                        return 'Campo Obrigatório';
                      }else{
                        List temp = k.split(",");
                        for( var valor in temp ){
                          int.parse(valor).isNegative;
                          if(int.parse(valor) < -1000 || int.parse(valor) > 1000 ){
                            return 'Os numeros deve esta entre -1000 e 1000';
                          }
                        }
                        return null;
                      }
                    }catch (e){
                      return 'Separe os numeros com virgulas';
                    }
                  },
                ),
                const SizedBox(height: 30,),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  onPressed: (){
                    if(formkey.currentState.validate()){
                      context.read<NumerosManager>().setNum(kcontroller.text);
                    }
                  },
                  child: Text("ORDENAR"),
                ),
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  child:  NumOrdenado(),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
