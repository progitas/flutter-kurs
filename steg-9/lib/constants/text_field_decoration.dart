import 'package:flutter/material.dart';

InputDecoration getFormFieldDecoration(BuildContext context, String label) {
  final primaryColor = Theme.of(context).primaryColor;
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
      color: primaryColor,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
    ),
  );
}
