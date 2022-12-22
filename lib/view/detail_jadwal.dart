import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/controller/detail_schedule_controller.dart';
import 'package:get/get.dart';

class DetailJadwal extends StatelessWidget {
  DetailJadwal({
    this.dayJadwal,
    super.key,
  });

  final String? dayJadwal;
  final cDetailSchedule = Get.put(DetailScheduleController());

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
              dayJadwal!,
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(45),
              child: InkWell(
                borderRadius: BorderRadius.circular(45),
                onTap: () {
                  print("DITEKAN");
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
      body: Obx(
        () => ListView.builder(
          itemCount: details.length,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(details[index]['title']),
                      ),
                      const Icon(
                        Icons.edit,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 26.0,
                      ),
                      const Icon(
                        Icons.delete_outline,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
