import 'package:get/get.dart';

import '../controllers/safety_brief_controller.dart';

class SafetyBriefBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafetyBriefController>(
      () => SafetyBriefController(),
    );
  }
}
