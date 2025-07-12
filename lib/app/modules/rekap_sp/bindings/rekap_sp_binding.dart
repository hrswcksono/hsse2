import 'package:get/get.dart';

import '../controllers/rekap_sp_controller.dart';

class RekapSpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekapSpController>(
      () => RekapSpController(),
    );
  }
}
