import 'package:get/get.dart';

import '../controllers/safety_brief_detail_controller.dart';

class SafetyBriefDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafetyBriefDetailController>(
      () => SafetyBriefDetailController(),
    );
  }
}
