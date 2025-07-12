import 'package:get/get.dart';

import '../controllers/rekap_sb_controller.dart';

class RekapSbBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekapSbController>(
      () => RekapSbController(),
    );
  }
}
