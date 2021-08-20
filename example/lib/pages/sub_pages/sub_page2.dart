import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

import '../home.dart';

class SubPage2 extends ModularPage<NoPageParameters> {
  SubPage2() : super(parameters: NoPageParameters());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Sub Page 2"),
        floatingActionButton: FloatingActionButton(
          heroTag: "Home",
          onPressed: () => context.navigateToPage(HomePage()),
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}
