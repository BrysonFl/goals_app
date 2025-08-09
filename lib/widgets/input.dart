import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final void Function(String value) onChanged;
  final String? placeholder;
  final Color? fillColor;
  final String? Function(String? value) validator;
  final bool obscureText;

  const Input({
    super.key,
    required this.onChanged,
    this.placeholder,
    this.fillColor,
    required this.validator,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintText: placeholder,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20)
        ),
        fillColor: fillColor,
        hintStyle: TextStyle(
          fontSize: 15
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red, width: 2)
        )
      ),
      validator: validator,
      obscureText: obscureText,
    );
  }
}