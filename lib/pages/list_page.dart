import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchase_order_app/util/products_tile.dart';
import 'package:purchase_order_app/data/database.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<TextEditingController> _controllers = [];

  showFilledFilds() {
    String message = "";
    for (var i = 0; i < productsList.length; i++) {
      if (_controllers[i].text.isNotEmpty) {
        message += "${productsList[i]}:${_controllers[i].text};\n";
      }
    }
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Column(
              children: [
                Text(message),
                Row(
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: message));
                      },
                      child: const Text("Зберегти в буфер обміну"),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    for (var element in _controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Закупка",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blue[200],
          child: Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 48,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Список закупки'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/listpage');
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Налаштуання списку'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settingspage');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: showFilledFilds,
          child: const Icon(
            Icons.copy,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            _controllers.add(TextEditingController());
            return ProductsTile(
              controller: _controllers[index],
              productName: productsList[index],
            );
          },
        ));
  }
}
