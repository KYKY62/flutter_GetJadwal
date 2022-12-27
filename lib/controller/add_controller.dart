import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddController extends GetxController {
  final course = TextEditingController();
  var selectedValue = "friday".obs;
}
