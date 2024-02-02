import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:purchase_order_app/util/products_tile.dart';
import 'package:purchase_order_app/data/database.dart';
import 'package:purchase_order_app/util/dialog_box.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _myBox = Hive.box('myBox');
  OrderListDB db = OrderListDB();

  final List<TextEditingController> _controllers = [];
  final _addNewItemController = TextEditingController();

  void deleteProduct(int index) {
    setState(() {
      db.productsList.removeAt(index);
    });
    db.updateDatabase();
  }

  void editProduct() {}

  void saveNewItem() {
    setState(() {
      db.productsList.add(_addNewItemController.text);
      _addNewItemController.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void addNewItem() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _addNewItemController,
          onSave: saveNewItem,
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    if (_myBox.get('ORDERLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  showFilledFilds() {
    String message = "";
    for (var i = 0; i < db.productsList.length; i++) {
      if (_controllers[i].text.isNotEmpty) {
        message += "${db.productsList[i]}:${_controllers[i].text};\n";
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
        title: const Text(
          "Закупка",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showFilledFilds,
        child: const Icon(
          Icons.copy,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 35.0),
          child: Row(
            children: [
              IconButton(
                onPressed: addNewItem,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 88),
        itemCount: db.productsList.length,
        itemBuilder: (context, index) {
          _controllers.add(TextEditingController());
          return ProductsTile(
            controller: _controllers[index],
            productName: db.productsList[index],
            deleteProduct: (context) => deleteProduct(index),
            editFunction: (context) => editProduct(),
          );
        },
      ),
    );
  }
}
