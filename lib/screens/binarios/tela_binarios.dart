import 'package:desafios_dig/custom_drawer/custom_drawer.dart';
import 'package:desafios_dig/models/binarios_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'result_binarios.dart';


class Binarios extends StatefulWidget {
  @override
  _BinariosState createState() => _BinariosState();
}

class _BinariosState extends State<Binarios> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String dropdownValue = "+  adição";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text("Calculadora de Binarios"), centerTitle: true,),
      body: SingleChildScrollView(padding: EdgeInsets.only(top: 35, left: 35, right: 35),
        child: Form(key: formkey,
          child: Column(
              children: [
                TextFormField(
                  controller: controllerA,
                  maxLength: 8,
                  maxLengthEnforced: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "Digite numeros binarios.",
                    hintText: "ex: 01010101",
                    border: OutlineInputBorder(
                        borderSide: BorderSide()
                    ),
                  ),
                  validator: (a){
                    if(a.isEmpty){
                      return 'Campo Obrigatório';
                    }else{
                      List temp = a.split("");
                      for( var valor in temp ){
                        if(valor != "0" && valor != "1"){
                          return 'Os numeros deve ter 0 e 1';
                        }
                      }
                      return null;
                    }
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15),
                  child: DropdownButton<String>(
                    isExpanded: false,
                    value: dropdownValue,
                    iconSize: 18,
                    elevation: 16,
                    //icon: Icon(Icons.arrow_drop_down, ),
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    underline: Container(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>["+  adição", "-  Subtração", "*  Multiplicação", "/  Divisão",]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                TextFormField(
                  controller: controllerB,
                  maxLength: 8,
                  maxLengthEnforced: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "Digite numeros binarios.",
                    hintText: "ex: 10101010",
                    border: OutlineInputBorder(
                        borderSide: BorderSide()
                    ),
                  ),
                  validator: (b){
                    if(b.isEmpty){
                      return 'Campo Obrigatório';
                    }else{
                      List temp = b.split("");
                      for( var valor in temp ){
                        if(valor != "0" && valor != "1"){
                          return 'Os numeros deve ter 0 e 1';
                        }
                      }
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10,),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  onPressed: (){
                    if(formkey.currentState.validate()){
                      context.read<BinariosManager>().setNum(
                          controllerA.text, controllerB.text, dropdownValue
                      );
                    }
                  },
                  child: Text("CALCULAR"),
                ),
                const SizedBox(height: 45,),
                SingleChildScrollView(
                  child: ResultadoBinario()
                ),
              ]
          ),
        ),
      ),
    );
  }
}
