import 'package:flutter/material.dart';
import 'package:purchase_order_app/pages/list_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const MyApp());

  //init the hive
  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
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
      },
    );
  }
}
