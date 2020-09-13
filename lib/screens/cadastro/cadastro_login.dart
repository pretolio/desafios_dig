import 'dart:async';
import 'package:desafios_dig/helper/validators.dart';
import 'package:desafios_dig/models/user.dart';
import 'package:desafios_dig/models/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CadastroLogin extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController resenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(key: scaffoldKey,backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text("NOVO CADASTRO", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: Consumer<UserManager>(
                builder: (contex, userManager, child ){
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
                      Padding(padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextFormField(
                          enabled: !userManager.load,
                          controller: nome,
                          decoration: const InputDecoration(hintText: "Nome Completo"),
                          keyboardType: TextInputType.text,
                          validator: (nome){
                            if(nome.isEmpty){
                              return 'Campo Obrigatório';
                            }else if(nome.trim().split(" ").length <= 1){
                              return 'Digite seu nome completo';
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                      TextFormField(
                          enabled: !userManager.load,
                          controller: email,
                          decoration: const InputDecoration(hintText: "E-mail"),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (email){
                            if(email.isEmpty){
                              return 'Campo Obrigatório';
                            }if(!emailValid(email)){
                              return 'E-mail inválido';
                            }else{
                              return null;
                            }
                          },
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextFormField(
                          enabled: !userManager.load,
                          controller: senha,
                          decoration: const InputDecoration(hintText: "Senha"),
                          keyboardType: TextInputType.visiblePassword,
                          autocorrect: false,
                          obscureText: true,
                          validator: (senha){
                            if(senha.length < 6 || senha.isEmpty){
                              return "Digite uma senha com mais de 6 caracter";
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                      TextFormField(
                        enabled: !userManager.load,
                        controller: resenha,
                        decoration: const InputDecoration(hintText: "Repita Senha"),
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        obscureText: true,
                        validator: (senha){
                          if(senha != this.senha.text || senha == null){
                            return "As senhas deve ser iguais";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20,),
                      RaisedButton(color: primaryColor,
                        padding: const EdgeInsets.all(5),
                        onPressed: userManager.load ? null : (){
                          if(formkey.currentState.validate()){
                            userManager.signUp(
                                user: Usuario(email: email.text.toLowerCase(), senha: senha.text, nome: nome.text),
                                onFail: (e){
                                  scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Falha no cadastro: $e'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: () async {
                                  await scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Cadastro Realizado com Sucesso'),
                                        backgroundColor: Colors.green,
                                      )
                                  );
                                  Future.delayed( Duration(milliseconds: 4000), (){
                                    Navigator.of(context).pushNamedAndRemoveUntil('/base', (Route<dynamic> route) => false);
                                  });
                                }
                            );
                          }
                        },
                        child: userManager.load ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white)) :
                        const Text("Cadastro", style: TextStyle(fontSize: 20, color: Colors.white),),
                        disabledColor: primaryColor.withAlpha(100),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
