// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/shared/extensions/extensions.dart';

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final String? errorText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const InputFormWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.errorText,
    this.focusNode,
    this.validator,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      validator: validator,
      focusNode: focusNode,
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
