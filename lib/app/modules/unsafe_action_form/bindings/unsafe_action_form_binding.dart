import 'package:get/get.dart';

import '../controllers/unsafe_action_form_controller.dart';

class UnsafeActionFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnsafeActionFormController>(
      () => UnsafeActionFormController(),
    );
  }
}
