import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ListUnsafeResponse.dart';
import 'package:hsse2/app/data/providers/unsafe_provider.dart';

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
    try {
      unsafeProvider
          .listSoalUnsafe(idjenisunsafe)
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
