import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/controller/add_controller.dart';
import 'package:get/get.dart';

class AddScheduleDialog {
  static void addSceduleDialog({
    context,
    required TextEditingController courseController,
    required String title,
    required bool isHomePage,
    required String value,
    required VoidCallback onTap,
    onChangeDropdown,
  }) async {
    final cAdd = Get.put(AddController());
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
              Obx(
                () => Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: cAdd.isEmpty.value == false
                        ? Border.all(
                            color: const Color(0xffD9019C),
                          )
                        : Border.all(
                            color: const Color(0xffE5E5E5),
                          ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextFormField(
                    controller: courseController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Mata Kuliah',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    ),
                    onChanged: (value) {
                      if (cAdd.selectedValue.value == "" &&
                          cAdd.course.text == "") {
                        cAdd.isEmpty(false);
                      } else {
                        cAdd.isEmpty(true);
                      }
                    },
                  ),
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
                        // focusColor: const Color(0xffD9019C),
                        // dropdownColor: const Color(0xffD9019C),
                        hint: const Text("Pilih hari"),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffD9019C).withOpacity(0.1),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                        ),
                        // value: "tuesday",
                        items: const [
                          DropdownMenuItem(
                            value: "monday",
                            child: Text("Senin"),
                          ),
                          DropdownMenuItem(
                              value: "tuesday", child: Text("Selasa")),
                          DropdownMenuItem(
                              value: "wednesday", child: Text("Rabu")),
                          DropdownMenuItem(
                              value: "thursday", child: Text("Kamis")),
                          DropdownMenuItem(
                              value: "friday", child: Text("Jumat")),
                        ],
                        onChanged: onChangeDropdown,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          actions: [
            Obx(
              () => GestureDetector(
                onTap: cAdd.isEmpty.value == false ? null : onTap,
                child: Container(
                  width: 122,
                  height: 48,
                  decoration: BoxDecoration(
                    color: cAdd.isEmpty.value == false
                        ? const Color(0xffD9019C).withOpacity(0.2)
                        : const Color(0xffD9019C),
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
            )
          ],
        );
      },
    );
  }
}
