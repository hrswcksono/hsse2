import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ListUnsafeResponse.dart';
import 'package:hsse2/app/data/providers/unsafe_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UnsafeActionController extends GetxController
    with StateMixin<List<ItemUnsafeList>> {
  var unsafeProvider = Get.put(UnsafeProvider());

  var idjenisunsafe = 0;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void getListUnsafe(idjenisunsafe) {
    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    try {
      unsafeProvider
          .listSoalUnsafe(idjenisunsafe)
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
    getListUnsafe(idjenisunsafe);
    xRefreshController.refreshCompleted();
  }
}
