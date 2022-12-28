import 'package:get/get.dart';

import 'package:flutter/material.dart';

class WidgetDialog {
  static void deleteDialog({
    context,
    required VoidCallback onTapDelete,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/deletedialog-icon.png",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text('Hapus Mata Kuliah',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Apakah anda yakin menghapus mata kuliah Statistika?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff888888)),
              ),
              const SizedBox(
                height: 17.0,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 122,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(47),
                    ),
                    child: const Center(
                      child: Text(
                        "Batal",
                        style: TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTapDelete,
                  child: Container(
                    width: 122,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffED4C5C),
                      borderRadius: BorderRadius.circular(47),
                    ),
                    child: const Center(
                      child: Text(
                        "Hapus",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
