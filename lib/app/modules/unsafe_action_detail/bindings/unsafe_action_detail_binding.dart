import 'package:get/get.dart';

import '../controllers/unsafe_action_detail_controller.dart';

class UnsafeActionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnsafeActionDetailController>(
      () => UnsafeActionDetailController(),
    );
  }
}
