// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductsTile extends StatelessWidget {
  final String productName;
  final TextEditingController controller;
  Function(BuildContext)? deleteProduct;
  Function(BuildContext)? editFunction;
  ProductsTile({
    super.key,
    required this.productName,
    required this.controller,
    required this.deleteProduct,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: deleteProduct,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: editFunction,
              backgroundColor: Colors.yellow,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: productName,
          ),
        ),
      ),
    );
  }
}
