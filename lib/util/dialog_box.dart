import 'package:flutter/material.dart';
import 'package:purchase_order_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.text,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(text: "Зберегти", onPressed: onSave),
                MyButton(text: "Відмінити", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
