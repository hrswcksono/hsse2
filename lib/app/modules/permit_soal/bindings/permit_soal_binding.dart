import 'package:get/get.dart';

import '../controllers/permit_soal_controller.dart';

class PermitSoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermitSoalController>(
      () => PermitSoalController(),
    );
  }
}
