import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class SubPage3 extends ModularPage<IdPageParameters> {
  SubPage3(IdPageParameters params) : super(parameters: params);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Sub Page 3: ${parameters.id}"),
        floatingActionButton: FloatingActionButton(
          heroTag: "Home",
          onPressed: () => MyApp.appModule.homeRoute.navigate(context: context),
          child: const Icon(Icons.home),
        ),
      ),
    );
  }
}
