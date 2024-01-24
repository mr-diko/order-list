import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchase_order_app/util/products_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> productsList = [
    "Криветка",
    "Лосось",
    "Вугор",
    "Авокадо",
    "Майонез",
    "Огірки"
  ];
  final List<TextEditingController> _controllers = [];

  @override
  void dispose() {
    for (var element in _controllers) {
      element.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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
          },
          child: const Icon(Icons.copy),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Закупка",
            style: TextStyle(color: Colors.white),
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
