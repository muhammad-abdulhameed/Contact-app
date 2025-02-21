import 'package:flutter/material.dart';

import '../core/colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String hintText;

  CustomTextField(
      {required this.controller, required this.type, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.secondaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.secondaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.secondaryColor))),
    );
  }
}
