import 'package:get/get.dart';
import 'package:hsse2/app/data/models/NotifikasiResponse.dart';
import 'package:hsse2/app/data/providers/user_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotifikasiController extends GetxController with StateMixin<List<NotifikasiItem>> {
  var isLoading = false.obs;

  var userProvider = Get.put(UserProvider());

  @override
  void onInit() {
    super.onInit();
    getListNotifikasi();
  }

  void getListNotifikasi() {
    try {
      userProvider
          .listNotifikasi()
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

  RefreshController xRefreshController = RefreshController(
    initialRefresh: false,
  );

  void onRefreshData() async {
    // monitor network fetch
    // if failed,use refreshFailed()
    getListNotifikasi();
    xRefreshController.refreshCompleted();
  }
}
