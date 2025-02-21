import 'dart:io';
import 'package:contact_app/dataClass/userData.dart';
import 'package:flutter/material.dart';

import '../componants/User.dart';
import '../core/colors.dart';

class UserPage extends StatefulWidget {
  static String routeName = "UserPage";

  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    UserData args = ModalRoute.of(context)?.settings.arguments as UserData;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.file(
                File(args.userPhoto),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * .7,
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    args.userName,
                    style: TextStyle(
                        color: AppColors.tertiaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ))
            ],
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(args.userEmail,
                style: TextStyle(
                    color: AppColors.tertiaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
          ),
          ListTile(
            leading: Icon(Icons.phone_in_talk),
            title: Text(args.userPhone,
                style: TextStyle(
                    color: AppColors.tertiaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  args.onTapDelete();
                  Navigator.of(context).pop();
                  setState(() {});
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
