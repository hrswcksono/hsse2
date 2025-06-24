import 'package:get/get.dart';

import '../controllers/safety_patrol_controller.dart';

class SafetyPatrolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafetyPatrolController>(
      () => SafetyPatrolController(),
    );
  }
}
