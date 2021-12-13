import 'package:flutter/material.dart';

class DropButtonIncidencia extends StatelessWidget {
  final String label;
  final String hintText;

  const DropButtonIncidencia(
      {Key? key, required this.label, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DropdownButtonFormField<String>(
        items: const [
          DropdownMenuItem(
            child: Text('Nuevo'),
          ),
        ],
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
        onChanged: (value) => null,
      ),
    );
  }
}
