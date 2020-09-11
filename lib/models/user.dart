import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario{
  String id;
  String nome;
  String email;
  String senha;

  Usuario({this.email, this.senha, this.nome, this.id});

  Usuario.fromDoc(DocumentSnapshot documentSnapshot){
    id = documentSnapshot.id;
    nome = documentSnapshot.data()["name"].toString();
    email = documentSnapshot.data()["email"].toString();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> saveData() async {
    await users.doc(id).set( toMap() )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Map<String, dynamic> toMap(){
    return {
      'name': nome,
      'email': email,
    };
  }
}