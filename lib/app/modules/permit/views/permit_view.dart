import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/app/modules/permit/controllers/permit_controller.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/global_widget.dart';

class PermitView extends GetView<PermitController> {
  PermitView({super.key});

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A89D),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Selamat datang, ${GetStorage().read(GetStorageKey.namarole)}!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.NOTIFIKASI);
                          },
                          child: Icon(Icons.notifications_none)),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Silahkan pilih dokumen berikut untuk memulai",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Tombol 1
                          Center(
                            child: buttonMenuWorkPermit(
                              "Hot Work Permit",
                              "assets/images/icon_hot_work_permit.png", // ganti dengan ikon sesuai desain
                              onTap: () {
                                if (arguments["asal"] == 'list' ||
                                    arguments["asal"] == 'approve') {
                                  Get.toNamed(
                                    Routes.PERMIT_LIST,
                                    arguments: {
                                      'idjenispermit': 2,
                                      'namapermit': 'Hot Work Permit',
                                      'asal': arguments["asal"],
                                    },
                                  );
                                } else if (arguments["asal"] == 'form') {
                                  Get.toNamed(
                                    Routes.PERMIT_FORM,
                                    arguments: {
                                      'idjenispermit': 2,
                                      'namapermit': 'Hot Work Permit',
                                      'asal': arguments["asal"],
                                    },
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Tombol 2
                          Center(
                            child: buttonMenuWorkPermit(
                              "Safe Work Permit",
                              "assets/images/icon_safe_work_permit.png",
                              onTap: () {
                                if (arguments["asal"] == 'list' ||
                                    arguments["asal"] == 'approve') {
                                  Get.toNamed(
                                    Routes.PERMIT_LIST,
                                    arguments: {
                                      'idjenispermit': 1,
                                      'namapermit': 'Safe Work Permit',
                                      'asal': arguments["asal"],
                                    },
                                  );
                                } else if (arguments["asal"] == 'form') {
                                  Get.toNamed(
                                    Routes.PERMIT_FORM,
                                    arguments: {
                                      'idjenispermit': 1,
                                      'namapermit': 'Safe Work Permit',
                                      'asal': arguments["asal"],
                                    },
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Tombol 2
                          Center(
                            child: buttonMenuWorkPermit(
                              "Confined Space Permit",
                              "assets/images/icon_confined_space_permit.png",
                              onTap: () {
                                print(arguments["asal"]);
                                if (arguments["asal"] == 'list' ||
                                    arguments["asal"] == 'approve') {
                                  Get.toNamed(
                                    Routes.PERMIT_LIST,
                                    arguments: {
                                      'idjenispermit': 3,
                                      'namapermit': 'Confined Space Permit',
                                      'asal': arguments["asal"],
                                    },
                                  );
                                } else if (arguments["asal"] == 'form') {
                                  Get.toNamed(
                                    Routes.PERMIT_FORM,
                                    arguments: {
                                      'idjenispermit': 3,
                                      'namapermit': 'Confined Space Permit',
                                      'asal': arguments["asal"],
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
