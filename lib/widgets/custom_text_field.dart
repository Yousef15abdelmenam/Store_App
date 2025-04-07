import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText,this.textInputType, this.onchanged, this.obsecureText = false});

  final String? hintText;
  Function(String)? onchanged;
  TextInputType? textInputType;
  bool? obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obsecureText!,
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
