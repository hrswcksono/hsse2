import 'package:get/get.dart';

import '../controllers/rekap_permit_controller.dart';

class RekapPermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekapPermitController>(
      () => RekapPermitController(),
    );
  }
}
