import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';

import '../controllers/permit_approve_controller.dart';

class PermitApproveView extends GetView<PermitApproveController> {
  PermitApproveView({super.key});

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.idpermit = arguments['id'];
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Approve Permit",
        pBgColor: CustomColor.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Obx(() {
                final isEditable =
                    GetStorage().read(GetStorageKey.namarole) == 'SPV HSE' &&
                    arguments['sudahapprove1'] == 0;

                final localFile = controller.imageFile.value;
                final ttdUrl = arguments['ttdapprove1'];

                print(ttdUrl);

                return GestureDetector(
                  onTap: isEditable ? controller.pickImage : null,
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child:
                        localFile != null && GetStorage().read(GetStorageKey.namarole) == 'SPV HSE'
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                localFile,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )
                            : (ttdUrl != null && ttdUrl.toString().isNotEmpty)
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                ttdUrl,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text("Gagal memuat gambar"),
                                  );
                                },
                              ),
                            )
                            : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Upload atau Ambil TTD",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                  ),
                );
              }),
              SizedBox(height: 5),
              globalButton(
                "Approve SPV HSE",
                isEnabled:
                    (GetStorage().read(GetStorageKey.namarole) == 'SPV HSE' &&
                        arguments['sudahapprove1'] == 0),
                onPressed: () {
                  controller.approvePermit();
                },
              ),
              SizedBox(height: 10),
              Obx(() {
                final isEditable =
                    GetStorage().read(GetStorageKey.namarole) == 'SPV AREA' &&
                    arguments['sudahapprove2'] == 0;

                final localFile = controller.imageFile.value;
                final ttdUrl =
                    arguments['ttdapprove2']; // Ambil dari argument atau backend

                return GestureDetector(
                  onTap: isEditable ? controller.pickImage : null,
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child:
                        localFile != null && GetStorage().read(GetStorageKey.namarole) == 'SPV AREA'
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                localFile,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )
                            : (ttdUrl != null && ttdUrl.toString().isNotEmpty)
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                ttdUrl,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text("Gagal memuat gambar TTD"),
                                  );
                                },
                              ),
                            )
                            : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Upload atau Ambil TTD",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                  ),
                );
              }),
              SizedBox(height: 5),
              globalButton(
                "Approve SPV Area",
                isEnabled:
                    (GetStorage().read(GetStorageKey.namarole) == 'SPV AREA' &&
                        arguments['sudahapprove2'] == 0),
                onPressed: () {
                  controller.approvePermit();
                },
              ),
              SizedBox(height: 10),
              Obx(() {
                final isEditable =
                    GetStorage().read(GetStorageKey.namarole) == 'MANAJER' &&
                    arguments['sudahapprove3'] == 0;

                final localFile = controller.imageFile.value;
                final ttdUrl = arguments['ttdapprove3'];

                return GestureDetector(
                  onTap: isEditable ? controller.pickImage : null,
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child:
                        localFile != null && GetStorage().read(GetStorageKey.namarole) == 'MANAJER'
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                localFile,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )
                            : (ttdUrl != null && ttdUrl.toString().isNotEmpty)
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                ttdUrl,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text("Gagal memuat gambar TTD"),
                                  );
                                },
                              ),
                            )
                            : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Upload atau Ambil TTD",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                  ),
                );
              }),
              SizedBox(height: 5),
              globalButton(
                "Approve Manajer",
                isEnabled:
                    (GetStorage().read(GetStorageKey.namarole) == 'MANAJER' &&
                        arguments['sudahapprove3'] == 0),
                onPressed: () {
                  controller.approvePermit();
                },
              ),
              SizedBox(height: 10),
              globalButton(
                arguments['statuspenyelesaian'] != null ? "Detail" : "Penyelesaian",
                isEnabled:
                    ((GetStorage().read(GetStorageKey.namarole) == 'SPV HSE' &&
                        arguments['sudahapprove1'] == 1 &&
                        arguments['sudahapprove2'] == 1 &&
                        arguments['sudahapprove3'] == 1)) || arguments['statuspenyelesaian'] != null,
                onPressed: () {
                  Get.toNamed(Routes.PERMIT_SELESAI, arguments: {
                    'id'                : controller.idpermit,
                    'statuspenyelesaian': arguments['statuspenyelesaian'],
                    'ttdpenyelesaian'   : arguments['ttdpenyelesaian']
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
