import 'package:flutter/material.dart';
import 'package:purchase_order_app/data/database.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Налаштування списку",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(productsList[1]),
                  const Spacer(),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
