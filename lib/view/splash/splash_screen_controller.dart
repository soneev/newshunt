import 'package:get/get.dart';
import 'package:newshunt/utils/route/route_name.dart';

class SplashScreenController extends GetxController {
  checkLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.toNamed(AppRoute.landing);
    });
  }

  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }
}
