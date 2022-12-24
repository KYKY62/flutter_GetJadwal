import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackbar {
  static var succesSnackbar = SnackBar(
    backgroundColor: Colors.white,
    margin: EdgeInsets.only(
      right: 20,
      left: 20,
      bottom: Get.height - 100,
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    content: Row(
      children: const [
        Icon(
          Icons.check,
          color: Colors.green,
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(
          "Mata Kuliah berhasil dihapus",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
