import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class NotFoundPage extends ModularPage<NoPageParameters> {
  NotFoundPage() : super(parameters: const NoPageParameters());

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text("Not Found"),
      ),
    );
  }
}
