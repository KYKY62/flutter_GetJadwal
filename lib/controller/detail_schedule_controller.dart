import 'package:flutter_getjadwal/service/detailschedule_service.dart';
import 'package:get/get.dart';

class DetailScheduleController extends GetxController {
  RxList listDetailSchedule = [].obs;

  getData() async {
    await DetailScheduleService().getDetailSchedule().then((value) {
      listDetailSchedule.value = value;
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
