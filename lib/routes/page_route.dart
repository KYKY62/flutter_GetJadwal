import 'package:flutter_getjadwal/routes/route_name.dart';
import 'package:flutter_getjadwal/view/home_view.dart';
import 'package:flutter_getjadwal/view/login_view.dart';
import 'package:get/get.dart';

class AppPage {
  static var pageName = [
    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomeView(),
    )
  ];
}
