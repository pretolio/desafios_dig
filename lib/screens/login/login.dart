import 'package:desafios_dig/helper/load.dart';
import 'package:desafios_dig/helper/validators.dart';
import 'package:desafios_dig/models/user.dart';
import 'package:desafios_dig/models/user_manager.dart';
import 'package:desafios_dig/screens/cadastro/cadastro_login.dart';
import 'package:desafios_dig/screens/login/recuperarsenha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class Login extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(key: scaffoldKey, backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CadastroLogin() ));
            },
            child: const Text("CRIAR CONTA", style: TextStyle(fontSize: 20,color: Colors.white),),
          )
        ],
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
                        controller: email,
                        decoration: const InputDecoration(hintText: "E-mail"),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email){
                          if(!emailValid(email)){
                            return 'E-mail inválido';
                          }else{
                            return null;
                          }

                        },
                      ),
                    ),
                    TextFormField(
                      enabled: !userManager.load,
                      controller: senha,
                      decoration: const InputDecoration(hintText: "Senha"),
                      keyboardType: TextInputType.visiblePassword,
                      autocorrect: false,
                      obscureText: true,
                      validator: (senha){
                        if(senha.length < 6 || senha.isEmpty){
                          return "Senha Invalida";
                        }else{
                          return null;
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        onPressed: userManager.load ? null : (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecuperarSenha(email)));
                        },
                        child: const Text("Esqueci minha senha"),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    RaisedButton(color: primaryColor,
                        disabledColor: primaryColor.withAlpha(100),
                        padding: const EdgeInsets.all(5),
                        onPressed: userManager.load ? null : (){
                          if(formkey.currentState.validate()){
                            loadTela(context);
                            userManager.signIn(
                                user: Usuario(email: email.text.toLowerCase(), senha: senha.text),
                                onFail: (e){
                                  Navigator.pop(context);
                                  scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Falha ao entrar: $e'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: () {
                                  Navigator.of(context).pushReplacementNamed('/base');
                                }
                            );
                          }
                        },
                        child: const Text("Entrar", style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                    const SizedBox(height: 16,),
                    RaisedButton(color: Colors.black,
                      disabledColor: Colors.black.withAlpha(100),
                      elevation: 8,
                      padding: const EdgeInsets.all(5),
                      onPressed: userManager.load ? null : (){
                        loadTela(context);
                        userManager.anonimo(
                            onFail: (e){
                              Navigator.pop(context);
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text('Falha ao entrar: $e'),
                                    backgroundColor: Colors.red,
                                  )
                              );
                            },
                            onSuccess: () {
                              Navigator.of(context).pushReplacementNamed('/base');
                            }
                        );
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("svg/anonymous.svg", color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Login Anonimo", style: TextStyle(fontSize: 20, color: Colors.white),),
                      ]),
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
