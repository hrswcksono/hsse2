import 'package:get/get.dart';

import '../controllers/permit_selesai_controller.dart';

class PermitSelesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermitSelesaiController>(
      () => PermitSelesaiController(),
    );
  }
}
