import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/global_widget.dart';
import '../controllers/safety_patrol_controller.dart';

class SafetyPatrolView extends GetView<SafetyPatrolController> {
  SafetyPatrolView({super.key});

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
                      const Icon(Icons.notifications_none),
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
                          const SizedBox(height: 40),

                          // Tombol 1
                          Center(
                            child: buttonMenu(
                              "Unsafe Action",
                              "assets/images/icon_unsafe_action.png", // ganti dengan ikon sesuai desain
                              onTap: () {
                                // print('test data');
                                if (arguments["asal"] == 'list' ||
                                    arguments["asal"] == 'approve') {
                                  Get.toNamed(
                                    Routes.UNSAFE_ACTION,
                                    arguments: {
                                      'idjenisunsafe': 1,
                                      'asal': arguments["asal"],
                                    },
                                  );
                                } else {
                                  Get.toNamed(
                                    Routes.UNSAFE_ACTION_FORM,
                                    arguments: {'idjenisunsafe': 1},
                                  );
                                }
                              },
                              size: 180,
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Tombol 2
                          Center(
                            child: buttonMenu(
                              "Unsafe Condition",
                              "assets/images/icon_unsafe_condition.png",
                              onTap: () {
                                if (arguments["asal"] == 'list' ||
                                    arguments["asal"] == 'approve') {
                                  Get.toNamed(
                                    Routes.UNSAFE_ACTION,
                                    arguments: {
                                      'idjenisunsafe': 2,
                                      'asal': arguments["asal"],
                                    },
                                  );
                                } else {
                                  Get.toNamed(
                                    Routes.UNSAFE_ACTION_FORM,
                                    arguments: {'idjenisunsafe': 2},
                                  );
                                }
                              },
                              size: 180,
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
