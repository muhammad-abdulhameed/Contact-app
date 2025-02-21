import 'package:contact_app/ui/home_screen.dart';
import 'package:contact_app/ui/user_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        UserPage.routeName: (context) => UserPage(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
