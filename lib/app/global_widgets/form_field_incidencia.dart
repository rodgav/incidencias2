import 'package:flutter/material.dart';

class FormFieldIncidencia extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String label;
  final String hintText;
  final int maxLines;

  const FormFieldIncidencia({Key? key,
    required this.controller,
    required this.validator,
    required this.label,
    required this.hintText,
    required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        controller:controller,
        validator: validator,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            label: Text(label),
            hintText: hintText,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15))),
        maxLines: maxLines,
      ),
    );
  }
}
