import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class NotFoundPage extends ModularPage<NoPageParameters> {
  NotFoundPage() : super(parameters: NoPageParameters());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Not Found"),
      ),
    );
  }
}
