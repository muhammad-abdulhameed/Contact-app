import 'dart:io';

import 'package:contact_app/core/colors.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  void Function(int) onDeleteTap;
  String userName;
  String userEmail;
  String userPhone;
  String userPhoto;
  int index;
  User({
    required this.onDeleteTap,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userPhoto,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.file(
                File(userPhoto),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    userName,
                    style: TextStyle(
                        color: AppColors.tertiaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ))
            ],
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: Text(userEmail,
                style: TextStyle(
                    color: AppColors.tertiaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
          ),
          ListTile(
            leading: const Icon(Icons.phone_in_talk),
            title: Text(userPhone,
                style: TextStyle(
                    color: AppColors.tertiaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.redAccent),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  onDeleteTap(index);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_rounded),
                    Text("Delete"),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
