import 'package:example/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class SubPage1Parameters extends PageParameters {
  SubPage1Parameters.fromMap(Map<String, String?> map) : super(map);

  SubPage1Parameters(String id) : super({'id': id});

  String get id => map['id']!;
  set id(String value) => map['id'] = value;
}

class SubPage1 extends ModularPage<SubPage1Parameters> {
  SubPage1(SubPage1Parameters parameters) : super(parameters: parameters);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(parameters.id),
        floatingActionButton: FloatingActionButton(
          heroTag: "Home",
          onPressed: () => context.navigateToPage(HomePage()),
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}
