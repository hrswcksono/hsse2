import 'package:get/get.dart';

import '../controllers/unsafe_action_controller.dart';

class UnsafeActionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnsafeActionController>(
      () => UnsafeActionController(),
    );
  }
}
