import 'package:bookshelf/di.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

void main() {
  setupDi();
  runApp(
      MaterialApp(
        title: 'Bookshelf',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/search",
        routes: Navigation.routes,
      )
  );
}