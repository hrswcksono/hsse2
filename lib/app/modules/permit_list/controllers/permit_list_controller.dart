import 'package:get/get.dart';
import 'package:hsse2/app/data/models/PermitResponse.dart';
import 'package:hsse2/app/data/providers/permit_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PermitListController extends GetxController
    with StateMixin<List<ListItemPermit>> {
  var permitProvider = Get.put(PermitProvider());

  var arguments = Get.arguments;

  var idjenispermit = 0;
  var asal = "";

  @override
  void onInit() {
    super.onInit();

    idjenispermit = arguments["idjenispermit"];
    asal = arguments["asal"];
  }

  void initList(pidjenispermit, asal) {
    if (asal == 'approve') {
      print('masuk');
      getListPermitApprove(pidjenispermit);
    } else {
      getListPermit(pidjenispermit);
    }
  }

  void getListPermit(int idjenispermit) {
    change(null, status: RxStatus.loading());
    try {
      permitProvider
          .getListPermit(idjenispermit)
          .then((value) {
            print(value.data);
            change(value.data, status: RxStatus.success());
          })
          .onError((error, _) {
            change(null, status: RxStatus.error());
          });
    } catch (e) {
      print(e);
      change(null, status: RxStatus.error());
    }
  }

  void getListPermitApprove(int idjenispermit) {
    change(null, status: RxStatus.loading());
    try {
      permitProvider
          .getListPermitApprove(idjenispermit)
          .then((value) {
            print(value.data);
            change(value.data, status: RxStatus.success());
          })
          .onError((error, _) {
            print(error);
            change(null, status: RxStatus.error());
          });
    } catch (e) {
      print('Testda at');
      change(null, status: RxStatus.error());
    }
  }

  RefreshController xRefreshController = RefreshController(
    initialRefresh: false,
  );

  void onRefreshData() async {
    // monitor network fetch
    // if failed,use refreshFailed()
    initList(idjenispermit, asal);
    xRefreshController.refreshCompleted();
  }
}
