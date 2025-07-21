import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ListSbResponse.dart';
import 'package:hsse2/app/data/providers/safety_brief_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SafetyBriefController extends GetxController with StateMixin<List<Sb>> {
  var sbProvider = Get.put(SafetyBriefProvider());

  @override
  void onInit() {
    super.onInit();
    getListSb();
  }

  void getListSb() {
    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    try {
      sbProvider
          .getListSB()
          .then((value) {
            Get.back();
            change(value.data, status: RxStatus.success());
          })
          .onError((error, _) {
            Get.back();
            change(null, status: RxStatus.error());
          });
    } catch (e) {
      Get.back();
      change(null, status: RxStatus.error());
    }
  }

  RefreshController xRefreshController = RefreshController(
    initialRefresh: false,
  );

  void onRefreshData() async {
    // monitor network fetch
    // if failed,use refreshFailed()
    getListSb();
    xRefreshController.refreshCompleted();
  }
}
