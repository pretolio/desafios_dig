import 'package:desafios_dig/models/binarios_manager.dart';
import 'package:desafios_dig/screens/base/tela_base.dart';
import 'package:desafios_dig/screens/cadastro/cadastro_login.dart';
import 'package:desafios_dig/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/numeros_manager.dart';
import 'models/user_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=> UserManager(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=> NumerosManager(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=> BinariosManager(),
        ),
      ],
      child: MaterialApp(
        title: "Store",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xfff5f5f5),
          primaryColor: Colors.indigo, //Color(0xfff7b5c0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => Login()
              );
            case '/cadastroLogin':
              return MaterialPageRoute(
                  builder: (_) => CadastroLogin()
              );
            case '/base':
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
            default:
              return MaterialPageRoute(
                  builder: (_) => Login()
              );
          }
        },
      ),
    )
  );
}
