// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ProductsTile extends StatelessWidget {
  final String productName;
  final TextEditingController controller;
  ProductsTile({
    super.key,
    required this.productName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: productName,
        ),
      ),
    );
  }
}
