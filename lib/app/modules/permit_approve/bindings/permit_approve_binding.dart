import 'package:get/get.dart';

import '../controllers/permit_approve_controller.dart';

class PermitApproveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermitApproveController>(
      () => PermitApproveController(),
    );
  }
}
