import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.controller,
    this.type = TextInputType.none,
    this.obscureText = false,
    required this.hint,
    this.color = Colors.grey,
    required this.validator,
  });
  final String? Function(String?) validator;
  final bool obscureText;
  final String hint;
  final Color color;
  final TextEditingController controller;
  final TextInputType type;
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      validator: widget.validator,
      keyboardType: widget.type,
      style: TextStyle(color: widget.color),
      cursorColor: widget.color,
      decoration: InputDecoration(
        hintText: widget.hint,
        isDense: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: widget.color)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.color)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.color)),
      ),
    );
  }
}
