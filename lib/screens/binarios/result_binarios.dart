import 'package:desafios_dig/models/binarios_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultadoBinario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BinariosManager>(
        builder: (context, binarioManager, __){
          return Container(width: double.infinity,
            child: binarioManager.loodresult ? Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Valor Binario: ${binarioManager.bin}",
                  style: TextStyle(fontSize: 22),),
                const SizedBox(height: 30,),
                Text("Valor Decimal:  ${binarioManager.dec.toInt()}",
                  style: TextStyle(fontSize: 22),),
              ]
            ): Container(),
          );
        }
    );
  }
}
