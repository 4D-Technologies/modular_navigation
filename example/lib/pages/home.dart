import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:example/pages/sub_pages/sub_page2.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class HomePage extends ModularPage<NoPageParameters> {
  HomePage() : super(parameters: NoPageParameters());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Home"),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "SubPage1",
              child: Icon(Icons.one_k),
              onPressed: () => context.navigateTo(
                page: SubPage1(
                  SubPage1Parameters("Testing 1,2,3"),
                ),
              ),
            ),
            FloatingActionButton(
              heroTag: "SubPage2",
              onPressed: () => context.navigateTo(page: SubPage2()),
              child: Icon(Icons.two_k),
            ),
          ],
        ),
      ),
    );
  }
}
