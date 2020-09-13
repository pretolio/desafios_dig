import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:desafios_dig/helper/validators.dart';
import 'package:desafios_dig/models/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecuperarSenha extends StatelessWidget {
  TextEditingController email = TextEditingController();

  RecuperarSenha(this.email);

  final GlobalKey<FormState> senhakey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: Text("Recuperar Senha"),
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Center(
            child: Form(key: senhakey,
              child: Consumer<UserManager>(
                  builder: (contex, userManager, child ){
                    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Informe seu email para receber o procedimento de recuperação da senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextFormField(
                          enabled: !userManager.load,
                          controller: email,
                          decoration: const InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                                borderSide: BorderSide()
                            ),
                          ),
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
                      RaisedButton(
                        color: primaryColor,
                        disabledColor: primaryColor.withAlpha(100),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text("Recuperar", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                          onPressed: (){
                            if(senhakey.currentState.validate()){
                              if(senhakey.currentState.validate()){
                                userManager.redefinirsenha(
                                  email: email.text,
                                  onSuccess: () async {
                                    await AwesomeDialog(
                                        context: context,
                                        animType: AnimType.SCALE,
                                        dialogType: DialogType.SUCCES,
                                        padding: EdgeInsets.all(15),
                                    body: Center(child: Text("Enviamos para seu email procedimento de redefinir senha",
                                    textAlign: TextAlign.center,style: TextStyle( fontSize: 16, ),
                                    ),),
                                    autoHide: Duration(seconds: 4),
                                    ).show();
                                  },
                                  onFail: () async {
                                    await AwesomeDialog(
                                        context: context,
                                        animType: AnimType.SCALE,
                                        dialogType: DialogType.ERROR,
                                        padding: EdgeInsets.all(15),
                                    body: Center(child: Text("Não foi possivel redefinir sua senha\nVerifique sua conexao com internet,\nE-mail e tente novamente!",
                                    textAlign: TextAlign.center,style: TextStyle(fontSize: 16, ),
                                    ),),
                                    autoHide: Duration(seconds: 5),
                                    ).show();
                                  },
                                );
                              }
                            }
                          }
                      )
                  ]);
                  }
                ),
              ),
          ),

    );
  }
}
