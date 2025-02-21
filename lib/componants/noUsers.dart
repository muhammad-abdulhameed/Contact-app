import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/colors.dart';

class NoUsers extends StatefulWidget {
  NoUsers({super.key});

  @override
  State<NoUsers> createState() => _NoUsersState();
}

class _NoUsersState extends State<NoUsers> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Lottie.asset("assets/lotti/Animation - 1735169954265.json",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  controller: _controller),
            ),
          ),
          Expanded(
            child: Text(
              "There is No Contacts Added Here",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]);
  }
}
