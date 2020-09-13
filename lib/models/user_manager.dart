import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafios_dig/helper/firebase_erros.dart';
import 'package:desafios_dig/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserManager extends ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User userLogin;
  Usuario usuario;
  bool userlooad = false;
  bool _load = false;
  bool get load => _load;

  UserManager(){
    _loadUser();
  }

  Future<void> signIn({Usuario user, Function onFail, Function onSuccess}) async {
    load = true;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email,
          password: user.senha
      );
      await _loadUser(usuarioIn: result.user);
      user.id = result.user.uid;
      userlooad = true;
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      onFail(getErrorString(e.code));
    } catch (e) {
      print(e);
      onFail(getErrorString(e.toString()));
    }

    load = false;
    notifyListeners();
  }

  Future<void> signUp({Usuario user, Function onFail, Function onSuccess}) async {
    load = true;
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: user.email,
          password: user.senha
      );
      this.usuario = user;
      user.id = result.user.uid;
      await user.saveData();

      userLogin = result.user;
      userlooad = true;
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      onFail(getErrorString(e.code));
    } catch (e) {
      print(e);
      onFail(getErrorString(e.toString()));
    }
    load = false;
    notifyListeners();
  }

  set load(bool valor){
    _load = valor ?? _load;
    notifyListeners();
  }

  _loadUser({User usuarioIn}) async {
    if(usuarioIn != null ){
      try{
        userLogin = usuarioIn;
        DocumentSnapshot docUser = await users.doc(usuarioIn.uid).get();
        usuario = await Usuario.fromDoc(docUser);
        userlooad = true;
        notifyListeners();
      }catch(e){
        print("erro 2  ${e}");
      }
    }else{
      await auth.authStateChanges().listen((User user) async {
        if(user != null) {
          userLogin = user;
          DocumentSnapshot docUser = await users.doc(user.uid).get();
          usuario = await Usuario.fromDoc(docUser);
          userlooad = true;
          notifyListeners();
        }
      }).onError((handleError){
        print("erro: ${handleError}");
      });
    }
  }

  signOut() async {
    try{
      await auth.signOut();
      usuario = null;
      userlooad = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }


}