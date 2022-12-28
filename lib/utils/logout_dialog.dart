import 'package:flutter_getjadwal/config/session.dart';
import 'package:flutter_getjadwal/routes/route_name.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class LogOutDialog {
  static void logOutDialog(context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit From GetJadwal?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('Are you sure you want to Exit?'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text("No"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () async {
                await Session.deleteUser();
                await Get.offAllNamed(RouteName.login);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
