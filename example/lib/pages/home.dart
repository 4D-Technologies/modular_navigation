import 'dart:math';

import 'package:example/main.dart';
import 'package:example/pages/sub_pages/sub_page1.dart';
import 'package:flutter/material.dart';
import 'package:modular_navigation/modular_navigation.dart';

class HomePage extends NoParametersModularPage {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Text("Home"),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "SubPage1",
              child: const Icon(Icons.one_k),
              onPressed: () =>
                  MyApp.appModule.subPagesModule.page1Route.navigate(
                context: context,
                parameters: SubPage1Parameters("Testing 1,2,3"),
              ),
            ),
            FloatingActionButton(
              heroTag: "SubPage2",
              onPressed: () => MyApp.appModule.subPagesModule.page2Route
                  .navigate(context: context),
              child: const Icon(Icons.two_k),
            ),
            FloatingActionButton(
              heroTag: "SubPage3",
              onPressed: () =>
                  MyApp.appModule.subPagesModule.page3Route.navigate(
                context: context,
                parameters: IdPageParameters(
                  Random().nextInt(1000 - 1).toString(),
                ),
              ),
              child: const Icon(Icons.three_k),
            ),
          ],
        ),
      ),
    );
  }
}
