import 'package:get/get.dart';

import '../controllers/unsafe_action_approal_controller.dart';

class UnsafeActionApproalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnsafeActionApproalController>(
      () => UnsafeActionApproalController(),
    );
  }
}
