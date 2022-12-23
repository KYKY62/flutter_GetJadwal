import 'package:flutter_getjadwal/service/detailschedule_service.dart';
import 'package:get/get.dart';

class DetailScheduleController extends GetxController {
  RxList listDetailSchedule = [].obs;

  getDataMonday() async {
    try {
      await DetailScheduleService().getDetailSchedule("monday").then((value) {
        listDetailSchedule.value = value;
      });
    } catch (e) {
      return e;
    }
  }

  getDataTuesday() async {
    try {
      await DetailScheduleService().getDetailSchedule("tuesday").then((value) {
        listDetailSchedule.value = value;
      });
    } catch (e) {
      return e;
    }
  }

  getDataWednesday() async {
    try {
      await DetailScheduleService()
          .getDetailSchedule("wednesday")
          .then((value) {
        listDetailSchedule.value = value;
      });
    } catch (e) {
      return e;
    }
  }

  getDataThursday() async {
    try {
      await DetailScheduleService().getDetailSchedule("thursday").then((value) {
        listDetailSchedule.value = value;
      });
    } catch (e) {
      return e;
    }
  }

  getDataFriday() async {
    try {
      await DetailScheduleService().getDetailSchedule("friday").then((value) {
        listDetailSchedule.value = value;
      });
    } catch (e) {
      return e;
    }
  }
}
