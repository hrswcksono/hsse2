import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ListSbResponse.dart';
import 'package:hsse2/app/data/providers/safety_brief_provider.dart';

class SafetyBriefController extends GetxController with StateMixin<List<Sb>> {
  var sbProvider = Get.put(SafetyBriefProvider());

  @override
  void onInit() {
    super.onInit();
    getListSb();
  }

  void getListSb() {
    try {
      sbProvider
          .getListSB()
          .then((value) {
            change(value.data, status: RxStatus.success());
          })
          .onError((error, _) {
            change(null, status: RxStatus.error());
          });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
