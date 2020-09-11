import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'numeros.dart';


class ProdutosManager extends ChangeNotifier {
  CollectionReference collectionProdutos = FirebaseFirestore.instance.collection('produtos');
  List<Produtos> produtos;

  ProdutosManager(){
    _loadProdutos();
  }

  _loadProdutos() async {
    await collectionProdutos.snapshots().listen( (event) {
      QuerySnapshot streamProdutos = event;
      produtos = streamProdutos.docs.map((e) => Produtos.fromDoc(e) ).toList();
      notifyListeners();
    }).onError((handleError){
      print(handleError);
    });
  }
}