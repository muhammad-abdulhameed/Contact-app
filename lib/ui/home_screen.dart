import 'dart:io';

import 'package:contact_app/componants/User.dart';
import 'package:contact_app/componants/noUsers.dart';
import 'package:contact_app/componants/textFieldWidget.dart';
import 'package:contact_app/componants/textUserInfo.dart';
import 'package:contact_app/dataClass/userData.dart';
import 'package:contact_app/ui/user_page.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/core/colors.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<UserData> data = [];
  late final AnimationController _controller;
  ImagePicker picker = ImagePicker();
  XFile? image;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: data.isNotEmpty,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      data.removeAt(data.length - 1);
                    });
                  },
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: Colors.redAccent,
                  foregroundColor: AppColors.secondaryColor,
                  child: const Icon(Icons.delete_rounded),
                ),
              ),
              Visibility(
                visible: data.length < 6,
                child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      context: context,
                      showDragHandle: true,
                      useSafeArea: false,
                      constraints:
                          BoxConstraints.expand(height: double.infinity),
                      backgroundColor: AppColors.primaryColor,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      builder: (context) {
                        return LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: ListView(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                imagePicker();
                                                setState(() {});
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 18,
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .secondaryColor)),
                                                child: image != null
                                                    ? Image.file(
                                                        File(image!.path))
                                                    : Image.asset(
                                                        "assets/images/pick image.png"),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextUserInfo(
                                                    controller:
                                                        userNameController
                                                            .text),
                                                Divider(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  height: 30,
                                                ),
                                                TextUserInfo(
                                                    controller:
                                                        emailController.text),
                                                Divider(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  height: 30,
                                                ),
                                                TextUserInfo(
                                                    controller:
                                                        phoneController.text),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Form(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomTextField(
                                            controller: userNameController,
                                            type: TextInputType.text,
                                            hintText: "Enter User Name"),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        CustomTextField(
                                            controller: emailController,
                                            type: TextInputType.emailAddress,
                                            hintText: "Enter User Email"),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        CustomTextField(
                                            controller: phoneController,
                                            type: TextInputType.phone,
                                            hintText: "Enter User Phone"),
                                      ],
                                    )),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    AppColors.secondaryColor),
                                            padding:
                                                const MaterialStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                  vertical: 18),
                                            ),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)))),
                                        onPressed: () {
                                          AddUser();
                                          setState(() {});
                                          print(data.length);
                                        },
                                        child: Text(
                                          "Enter User",
                                          style: TextStyle(
                                              color: AppColors.tertiaryColor),
                                        ))
                                  ],
                                ),
                              ),
                            ]),
                          );
                        });
                      },
                    );
                  },
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: AppColors.secondaryColor,
                  foregroundColor: AppColors.tertiaryColor,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
                margin: const EdgeInsets.only(left: 26, top: 24, bottom: 20),
                child: Image.asset("assets/images/route logo.png")),
          ),
          body: data.isNotEmpty
              ? GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.sizeOf(context).aspectRatio / .9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(UserPage.routeName,
                            arguments: UserData(
                              userName: data[index].userName,
                              userEmail: data[index].userEmail,
                              userPhone: data[index].userPhone,
                              userPhoto: data[index].userPhoto,
                              onTapDelete: () => Deleteuser(index),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: User(
                          index: index,
                          userName: data[index].userName,
                          userEmail: data[index].userEmail,
                          userPhone: data[index].userPhone,
                          userPhoto: data[index].userPhoto,
                          onDeleteTap: Deleteuser, //how it works And different call it as pointer Pointer ?
                        ),
                      ),
                    );
                  },
                )
              : NoUsers()),
    );
  }

  Future<void> imagePicker() async {
    image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: MediaQuery.of(context).size.height * 1 / 3,
        maxWidth: MediaQuery.of(context).size.width * 1 / 3);
    setState(() {});
    print("${image?.path} -----------------------------");
  }

  void AddUser() {
    if (data.length < 6) {
      data.add(UserData(
          userName: userNameController.text,
          userEmail: emailController.text,
          userPhone: phoneController.text,
          userPhoto: image!.path,
          onTapDelete: () {}));
    } else {
      return;
    }
  }

  void Deleteuser(int index) {
    setState(() {
      data.removeAt(index);
    });
  }
}
