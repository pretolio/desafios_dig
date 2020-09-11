import 'package:cloud_firestore/cloud_firestore.dart';

class Produtos{
  String id;
  String nome;
  String descricao;
  List<String> img;

  Produtos({this.descricao, this.img, this.nome, this.id});

  Produtos.fromDoc(DocumentSnapshot documentSnapshot){
    id = documentSnapshot.id;
    nome = documentSnapshot.data()["nome"].toString();
    descricao = documentSnapshot.data()["descricao"].toString();
    img = List<String>.from(documentSnapshot.data()["img"] as List<dynamic>);
  }
  
}