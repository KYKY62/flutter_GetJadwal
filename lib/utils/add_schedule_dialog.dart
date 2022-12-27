import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScheduleDialog {
  static void addSceduleDialog({
    context,
    required String title,
    required bool isHomePage,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Color(0xffA4A4A4),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 11.0,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 17.0,
              ),
              const Text(
                "Mata Kuliah",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffE5E5E5),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Masukkan Mata Kuliah',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 11.0,
              ),
              isHomePage == true
                  ? const Text(
                      "Pilih Hari",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 4.0,
              ),
              isHomePage == true
                  ? Container(
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffE5E5E5),
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButtonFormField(
                        hint: const Text("Pilih hari"),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "Senin",
                            child: Text("Senin"),
                          ),
                          DropdownMenuItem(
                              value: "Selasa", child: Text("Selasa")),
                          DropdownMenuItem(value: "Rabu", child: Text("Rabu")),
                          DropdownMenuItem(
                              value: "Kamis", child: Text("Kamis")),
                          DropdownMenuItem(
                              value: "Jumat", child: Text("Jumat")),
                        ],
                        onChanged: (value) {},
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 122,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffD9019C).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(47),
                ),
                child: const Center(
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
