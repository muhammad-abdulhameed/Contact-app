import 'package:flutter/material.dart';

import '../core/colors.dart';

class TextUserInfo extends StatelessWidget {
  TextUserInfo({required this.controller});

  String controller;

  @override
  Widget build(BuildContext context) {
    return Text(
      controller,
      style: TextStyle(color: AppColors.secondaryColor),
    );
  }
}
