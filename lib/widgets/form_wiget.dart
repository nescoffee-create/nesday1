// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormWiget extends StatelessWidget {
  const FormWiget({
    Key? key,
    this.hint,
    this.suffixIcon,
    this.obscureText,
  }) : super(key: key);

  final String? hint;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
