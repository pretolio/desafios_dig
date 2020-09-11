import 'package:desafios_dig/models/page_manager.dart';
import 'package:desafios_dig/screens/binarios/tela_binarios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics:  const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            appBar: AppBar(title: const Text("Page 0"),),
          ),

          TelaProdutos(),
        ],
      ),
    );
  }
}
