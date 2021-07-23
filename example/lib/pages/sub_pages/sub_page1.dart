import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modular_navigation/modular_navigation.dart';

class SubPage1Parameters extends PageParameters {
  SubPage1Parameters.fromMap(Map<String, String?> map) : super(map);

  SubPage1Parameters(String id) : super({'id': id});

  String get id => map['id']!;
  set id(String value) => map['id'] = value;
}

class SubPage1 extends StatelessWidget {
  final SubPage1Parameters parameters;
  SubPage1(this.parameters);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(parameters.id),
    );
  }
}
