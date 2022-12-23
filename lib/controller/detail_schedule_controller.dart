import 'package:flutter_getjadwal/service/detailschedule_service.dart';
import 'package:get/get.dart';

class DetailScheduleController extends GetxController {
  RxList listDetailSchedule = [].obs;

  getDataMonday() async {
    await DetailScheduleService().getDetailSchedule("monday").then((value) {
      listDetailSchedule.value = value;
      print(listDetailSchedule);
    });
  }

  getDataTuesday() async {
    await DetailScheduleService().getDetailSchedule("tuesday").then((value) {
      listDetailSchedule.value = value;
      print(listDetailSchedule);
    });
  }

  getDataWednesday() async {
    await DetailScheduleService().getDetailSchedule("wednesday").then((value) {
      listDetailSchedule.value = value;
      print(listDetailSchedule);
    });
  }

  getDataThursday() async {
    await DetailScheduleService().getDetailSchedule("thursday").then((value) {
      listDetailSchedule.value = value;
      print(listDetailSchedule);
    });
  }

  getDataFriday() async {
    await DetailScheduleService().getDetailSchedule("friday").then((value) {
      listDetailSchedule.value = value;
      print(listDetailSchedule);
    });
  }

  @override
  void onInit() {
    getDataMonday();
    getDataTuesday();
    getDataWednesday();
    getDataThursday();
    getDataFriday();
    super.onInit();
  }
}
