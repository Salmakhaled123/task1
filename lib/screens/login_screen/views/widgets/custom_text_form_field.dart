import 'package:flutter/material.dart';

import '../../../../core/appfont.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({

    Key? key, required this.hintText, required this.inputType, required this.controller, this.validator,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(keyboardType: inputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppFont.text16,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff091E4A)),
      borderRadius: BorderRadius.circular(
        4,
      ),
    );
  }
}
