import 'package:desafios_dig/custom_bottom/custom_bottom.dart';
import 'package:desafios_dig/models/page_manager.dart';
import 'package:desafios_dig/models/user_manager.dart';
import 'package:desafios_dig/screens/binarios/tela_binarios.dart';
import 'package:desafios_dig/screens/numeros/tela_numeros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    context.read<UserManager>().signOut();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => PageManager(pageController),
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics:  const NeverScrollableScrollPhysics(),
          children: <Widget>[
            NumerosInteiros(),
            Binarios(),
          ],
        ),
        bottomNavigationBar: CustomBottom(),
      )
    );
  }
}
