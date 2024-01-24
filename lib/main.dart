import 'package:flutter/material.dart';
import 'package:purchase_order_app/pages/list_page.dart';
import 'package:purchase_order_app/pages/list_setitngs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListPage(),
      routes: {
        '/listpage': (context) => const ListPage(),
        '/settingspage': (context) => const SettingsPage(),
      },
    );
  }
}
