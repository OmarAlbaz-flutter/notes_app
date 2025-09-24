import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    // this.onChanged,
    // this.validator,
    this.obscureText,
    this.onSaved,
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  // final void Function(String)? onChanged;
  final bool? obscureText;
  // final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      // onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      cursorColor: kPrimaryColor,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: kPrimaryColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(
          kPrimaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
