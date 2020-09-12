import 'dart:collection';

import 'package:flutter/material.dart';

class NumerosManager extends ChangeNotifier {
  List<int> listNumeros = [];

  void setNum(String k ){
    k.replaceAll(" ", "").split(",").map((e) =>
        listNumeros.add(int.parse(e)) ).toList();

    Map<String, List<int> > groupedMap = HashMap();
    listNumeros.forEach((element) {
      groupedMap..putIfAbsent( element.toString() , () => []).add(element);
    });
    listNumeros = groupedMap.values.map((list) {
      return list.reduce((value, entry,) {
        value = value;
        return value;
      });
    }).toList();

    listNumeros.sort( (a,b) => a.compareTo(b) );

    notifyListeners();
  }
}