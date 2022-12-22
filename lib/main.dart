import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/config/session.dart';
import 'package:flutter_getjadwal/models/user_login.dart';
import 'package:flutter_getjadwal/routes/page_route.dart';
import 'package:flutter_getjadwal/view/home_view.dart';
import 'package:flutter_getjadwal/view/login_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.pageName,
      home: FutureBuilder(
        future: Session.getUser(),
        builder: (BuildContext context, AsyncSnapshot<UserLogin> snapshot) {
          if (snapshot.data != null && snapshot.data?.id != null) {
            return const HomeView();
          }
          return LoginView();
        },
      ),
    );
  }
}
