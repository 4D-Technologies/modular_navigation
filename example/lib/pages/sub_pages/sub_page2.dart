import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class SubPage2 extends NoParametersModularPage {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Sub Page 2"),
        floatingActionButton: FloatingActionButton(
          heroTag: "Home",
          onPressed: () => MyApp.appModule.homeRoute.navigate(context: context),
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}
