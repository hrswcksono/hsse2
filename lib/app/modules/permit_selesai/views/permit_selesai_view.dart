import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';

import '../controllers/permit_selesai_controller.dart';

class PermitSelesaiView extends GetView<PermitSelesaiController> {
  PermitSelesaiView({super.key});

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.idpermit = arguments['id'];

    if(arguments['statuspenyelesaian'] == 1) {
      controller.pekerjaanSelesai.value = true;
      controller.pekerjaanPermitBaru.value = false;
    } else {
      controller.pekerjaanPermitBaru.value = true;
      controller.pekerjaanSelesai.value = false;
    }

    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Selesaikan Permit",
        pBgColor: CustomColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Status Penyelesaian",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            buildCheckbox(
              'Pekerjaan Selesai',
              controller.pekerjaanSelesai,
              onSelected: () {
                controller.pekerjaanPermitBaru.value = false;
              },
              disabled: arguments['statuspenyelesaian'] != null
            ),
            buildCheckbox(
              'Pekerjaan Membutuhkan Permit Baru',
              controller.pekerjaanPermitBaru,
              onSelected: () {
                controller.pekerjaanSelesai.value = false;
              },
              disabled: arguments['statuspenyelesaian'] != null
            ),
            const Text(
              "Tanda Tangan Penyelesaian",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Obx(() {
              final isEditable =
                  GetStorage().read(GetStorageKey.namarole) == 'MANAJER' &&
                  arguments['sudahapprove3'] == 0;

              final localFile = controller.imageFile.value;
              final ttdUrl = arguments['ttdpenyelesaian'];

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
                      localFile != null
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
                                  child: Text("Upload atau Ambil TTD"),
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
            buildTextField(
              "Nama",
              TextEditingController(
                text: GetStorage().read(GetStorageKey.nama),
              ),
              readOnly: true,
            ),
            const Text(
              "Jam dan Tanggal Akan Terisi Otomatis",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: buildTextField(
                    "Tanggal",
                    TextEditingController(
                      text: arguments['tglubahstatus']
                    ),
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: buildTextField(
                    "Jam",
                    TextEditingController(
                      text: arguments['jamubahstatus']
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (arguments['statuspenyelesaian'] == null)
              globalButton(
                "Permit Selesai",
                // isEnabled: controller.isApprovedEnabled.value,
                onPressed: () {
                  controller.donePermit();
                },
              ),
          ],
        ),
      ),
    );
  }
}
