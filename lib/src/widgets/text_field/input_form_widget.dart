import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/shared/extensions/extensions.dart';

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final String? errorText;
  final String? Function(String?)? validator;

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        hintStyle: TypographyApp.text1.grey,
        border: InputBorder.none,
      ),
      style: TypographyApp.text1,
    );
  }
}
