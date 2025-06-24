import 'package:get/get.dart';

import '../controllers/safety_patrol_approval_controller.dart';

class SafetyPatrolApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafetyPatrolApprovalController>(
      () => SafetyPatrolApprovalController(),
    );
  }
}
