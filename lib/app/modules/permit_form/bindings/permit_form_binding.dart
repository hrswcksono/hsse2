import 'package:get/get.dart';

import '../controllers/permit_form_controller.dart';

class PermitFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermitFormController>(
      () => PermitFormController(),
    );
  }
}
