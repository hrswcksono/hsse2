import 'package:get/get.dart';
import 'package:hsse2/app/data/models/PermitResponse.dart';
import 'package:hsse2/app/data/providers/permit_provider.dart';

class PermitListController extends GetxController
    with StateMixin<List<ListItemPermit>> {
  var permitProvider = Get.put(PermitProvider());

  var arguments = Get.arguments;

  var idjenispermit = 0;

  @override
  void onInit() {
    super.onInit();

    idjenispermit = arguments["idjenispermit"];
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
}
