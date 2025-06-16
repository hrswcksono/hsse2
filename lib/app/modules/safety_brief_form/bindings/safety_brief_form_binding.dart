import 'package:get/get.dart';

import '../controllers/safety_brief_form_controller.dart';

class SafetyBriefFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafetyBriefFormController>(
      () => SafetyBriefFormController(),
    );
  }
}
