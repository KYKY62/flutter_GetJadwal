import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/controller/add_controller.dart';
import 'package:flutter_getjadwal/controller/delete_controller.dart';
import 'package:flutter_getjadwal/controller/detail_schedule_controller.dart';
import 'package:flutter_getjadwal/utils/add_schedule_dialog.dart';
import 'package:flutter_getjadwal/utils/delete_dialog.dart';
import 'package:flutter_getjadwal/utils/snackbar.dart';
import 'package:get/get.dart';

class DetailJadwal extends StatelessWidget {
  DetailJadwal({
    required this.getData,
    required this.itemCount,
    required this.day,
    required this.onTap,
    super.key,
  });

  final dynamic getData;
  final int itemCount;
  final String day;
  final dynamic onTap;

  final cDetailSchedule = Get.put(DetailScheduleController());
  final cAdd = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    final details = cDetailSchedule.listDetailSchedule;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 14.0,
              ),
            ),
            const SizedBox(
              width: 19.0,
            ),
            Text(
              day,
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Material(
              color: const Color(0xffD9019C),
              borderRadius: BorderRadius.circular(45),
              child: InkWell(
                borderRadius: BorderRadius.circular(45),
                onTap: () {
                  AddScheduleDialog.addSceduleDialog(
                    context: context,
                    courseController: cAdd.course,
                    title: "Tambah Mata Kuliah",
                    isHomePage: false,
                    value: cAdd.selectedValue.value,
                    onTap: onTap,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        Text(
                          "Buat Jadwal Kuliah",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: details.isNotEmpty
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: Get.width,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 15,
                          offset: Offset(6, 10),
                          color: Colors.black12,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(details[index]['title']),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "assets/edit-icon.png",
                              width: 15.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 26.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              DeleteDialog.deleteDialog(
                                context: context,
                                onTapDelete: () {
                                  DeleteController().deleteSchedule(
                                    details[index]['id'].toString(),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(MySnackbar.succesSnackbar);
                                  Get.back();
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/delete-icon.png",
                              width: 15.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Image.asset(
                "assets/todo-empty.png",
                width: Get.width / 2,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
