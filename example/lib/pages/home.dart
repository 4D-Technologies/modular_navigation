import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home"),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.navigateTo(
          ModularRoute(
            MyApp.appModule.subModule.subPageOne,
            parameters: SubPage1Parameters("Testing 1,2,3"),
          ),
        ),
      ),
    );
  }
}
