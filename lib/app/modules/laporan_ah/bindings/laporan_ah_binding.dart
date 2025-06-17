import 'package:get/get.dart';

import '../controllers/laporan_ah_controller.dart';

class LaporanAhBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanAhController>(
      () => LaporanAhController(),
    );
  }
}
