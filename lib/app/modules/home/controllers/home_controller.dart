import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  var isPopupVisible = false.obs;

  void togglePopup() {
    isPopupVisible.value = !isPopupVisible.value;
  }

  void hidePopup() {
    isPopupVisible.value = false;
  }
}
