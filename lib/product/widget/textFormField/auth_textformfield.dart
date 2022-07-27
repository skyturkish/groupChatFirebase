import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key, required this.labelText, this.isPassword = false, this.validator, required this.controller})
      : super(key: key);
  final String labelText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.isPassword,
        decoration: TextInputDecorationConstants.textFormField.copyWith(
          labelText: widget.labelText,
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onChanged: (val) {
          value = val;
          setState(() {});
          print(value);
        },
        validator: widget.validator);
  }
}

class TextInputDecorationConstants {
  static const InputDecoration textFormField = InputDecoration(
    labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purple, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
    ),
  );
}
