import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/controller/detail_schedule_controller.dart';
import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:flutter_getjadwal/models/schedule.dart';
import 'package:flutter_getjadwal/service/schedule_service.dart';
import 'package:flutter_getjadwal/utils/gridview_jadwal.dart';
import 'package:flutter_getjadwal/utils/logout_dialog.dart';
import 'package:flutter_getjadwal/view/detail_jadwal.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final loginC = Get.put(LoginController());
  final cDetailSchedule = Get.put(DetailScheduleController());

  RefreshController refreshController = RefreshController();
  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    getData();
    refreshController.refreshCompleted();
  }

  Schedule schedule = Schedule();

  getData() async {
    try {
      await ScheduleService()
          .getScheduleService(email: "${loginC.getData.email}")
          .then((value) {
        setState(() {
          schedule = value;
        });
      });
    } catch (e) {
      return e;
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final details = cDetailSchedule;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A0B48),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("GetJadwal"),
            Material(
              color: const Color(0xffD9019C),
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  LogOutDialog.logOutDialog(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  width: 175,
                  decoration: BoxDecoration(
                    // color: const Color(0xffD9019C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Check out | ",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: Obx(
                          () => Text(
                            loginC.getData.email != null
                                ? "${loginC.getData.email}"
                                : "null",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: _onRefresh,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 200,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9019C),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 24,
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
            SizedBox(
              height: Get.height,
              child: GridView(
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                children: [
                  GridViewJadwal(
                    hariJadwal: "Senin",
                    totalJadwal: schedule.data?.monday == 0
                        ? "Belum ada mata kuliah"
                        : "${schedule.data?.monday} Mata Kuliah",
                    color: schedule.data?.monday == 0
                        ? const Color(0xffBBBBBB)
                        : const Color(0xffD9019C),
                    onTap: () => Get.to(() => Obx(
                          () => DetailJadwal(
                            getData: details.getDataMonday(),
                            itemCount: details.listDetailSchedule.length,
                            day: "Senin",
                          ),
                        )),
                  ),
                  GridViewJadwal(
                    hariJadwal: "Selasa",
                    totalJadwal: schedule.data?.tuesday == 0
                        ? "Belum ada mata kuliah"
                        : "${schedule.data?.tuesday} Mata Kuliah",
                    color: schedule.data?.tuesday == 0
                        ? const Color(0xffBBBBBB)
                        : const Color(0xffD9019C),
                    onTap: () => Get.to(() => Obx(
                          () => DetailJadwal(
                            getData: details.getDataTuesday(),
                            itemCount: details.listDetailSchedule.length,
                            day: "Selasa",
                          ),
                        )),
                  ),
                  GridViewJadwal(
                    hariJadwal: "Rabu",
                    totalJadwal: schedule.data?.wednesday == 0 ||
                            schedule.data?.wednesday == null
                        ? "Belum ada mata kuliah"
                        : "${schedule.data?.wednesday} Mata Kuliah",
                    color: schedule.data?.wednesday == 0 ||
                            schedule.data?.wednesday == null
                        ? const Color(0xffBBBBBB)
                        : const Color(0xffD9019C),
                    onTap: () => Get.to(() => Obx(
                          () => DetailJadwal(
                            getData: details.getDataWednesday(),
                            itemCount: details.listDetailSchedule.length,
                            day: "Rabu",
                          ),
                        )),
                  ),
                  GridViewJadwal(
                    hariJadwal: "Kamis",
                    totalJadwal: schedule.data?.thursday == 0 ||
                            schedule.data?.thursday == null
                        ? "Belum ada mata kuliah"
                        : "${schedule.data?.thursday} Mata Kuliah",
                    color: schedule.data?.thursday == 0 ||
                            schedule.data?.thursday == null
                        ? const Color(0xffBBBBBB)
                        : const Color(0xffD9019C),
                    onTap: () => Get.to(() => Obx(
                          () => DetailJadwal(
                            getData: details.getDataThursday(),
                            itemCount: details.listDetailSchedule.length,
                            day: "Kamis",
                          ),
                        )),
                  ),
                  GridViewJadwal(
                    hariJadwal: "Jumat",
                    totalJadwal: schedule.data?.friday == 0 ||
                            schedule.data?.friday == null
                        ? "Belum ada mata kuliah"
                        : "${schedule.data?.friday} Mata Kuliah",
                    color: schedule.data?.friday == 0 ||
                            schedule.data?.friday == null
                        ? const Color(0xffBBBBBB)
                        : const Color(0xffD9019C),
                    onTap: () => Get.to(
                      () => Obx(
                        () => DetailJadwal(
                          getData: details.getDataFriday(),
                          itemCount: details.listDetailSchedule.length,
                          day: "Jumat",
                        ),
                      ),
                    ),
                    // ! Nanti lempar paramater http sesuai hari jadi nanti hasil pasti sesuai dengan harinya
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
