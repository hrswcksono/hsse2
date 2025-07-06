import 'package:get/get.dart';
import 'package:hsse2/app/data/models/PermitResponse.dart';
import 'package:hsse2/app/data/providers/permit_provider.dart';

class PermitListController extends GetxController  with StateMixin<List<ListItemPermit>> {
  var permitProvider = Get.put(PermitProvider());

  
  var data = Get.arguments;

  var idjenispermit = 0;

  @override
  void onInit() {
    super.onInit();

    getListPermit(data['idjenispermit']);
  }

  void getListPermit(int idjenispermit) {
    change(null, status: RxStatus.loading());
    try {
      permitProvider.getListPermit(idjenispermit).then((value) {
        change(value.data, status: RxStatus.success());
      }).onError((error, _) {
        change(null, status: RxStatus.error());
      });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
