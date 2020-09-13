import 'package:flutter/material.dart';

class BinariosManager extends ChangeNotifier {
  List listA;
  List listB;
  String bin = "";
  double dec = 0;
  bool loodresult = false;

  void setNum(String binA, String binB, k){
    listA = binA.split("");
    listB = binB.split("");
    double exp = 128;
    int i = 0;
    int a = 0;
    int b = 0;
    while(i<8){
      a = (int.parse(listA[i]) * exp.toInt()) + a;
      b = (int.parse(listB[i]) * exp.toInt()) + b;
      exp /= 2;
      i++;
    }

    switch(k){
      case "+  adição" :
        dec = a.toDouble() + b.toDouble();
        break;
      case "-  Subtração" :
        if(a>b){
          dec = a.toDouble() - b.toDouble();
        }else{
          dec = b.toDouble() - a.toDouble();
        }
        break;
      case "/  Divisão" :
        if(a>b){
          dec = a / b;
        }else{
          dec = b / a;
        }
        break;
      case "*  Multiplicação" :
        dec = a.toDouble() * b.toDouble();
        break;
    }

    double tempdec = dec;
    bin = "";
    if(tempdec>0){
      while (tempdec>=1) {
        bin = ((tempdec % 2 == 0)?"0":"1" ) + bin;
        tempdec /= 2 ;
      }
    }
    bin = bin.padLeft(8,"0");
    loodresult = true;
    notifyListeners();
  }

}