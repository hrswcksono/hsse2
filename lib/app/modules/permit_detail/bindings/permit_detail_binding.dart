import 'package:get/get.dart';

import '../controllers/permit_detail_controller.dart';

class PermitDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermitDetailController>(
      () => PermitDetailController(),
    );
  }
}
