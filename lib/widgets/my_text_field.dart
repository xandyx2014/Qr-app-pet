import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final int minLines;
  final Icon icon;
  final void Function(String) onChanged;
  MyTextField(
      {this.label,
      this.maxLines = 1,
      this.minLines = 1,
      this.icon,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // print(value); ❤
        this.onChanged(value);
      },
      style: TextStyle(color: Colors.black87),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon == null ? null : icon,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black45),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
