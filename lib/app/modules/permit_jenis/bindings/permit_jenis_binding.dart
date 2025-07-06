import 'package:get/get.dart';

import '../controllers/permit_jenis_controller.dart';

class PermitJenisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermitJenisController>(
      () => PermitJenisController(),
    );
  }
}
