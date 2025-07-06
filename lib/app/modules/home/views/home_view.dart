import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';
import '../../../widgets/global_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
                        onTap: () => controller.togglePopup(),
                        child: const Icon(Icons.menu, color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Selamat datang, ${GetStorage().read(GetStorageKey.namarole)}!',
                          style: const TextStyle(
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
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
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            children: [
                              buttonMenu(
                                "Safety Briefing",
                                "assets/images/icon_sb.png",
                                onTap: () => Get.toNamed(Routes.SAFETY_BRIEF),
                              ),
                              buttonMenu(
                                "Safety Patrol",
                                "assets/images/icon_sp.png",
                                onTap: () => Get.toNamed(Routes.SAFETY_PATROL),
                              ),
                              buttonMenu(
                                "Approval Safety Patrol",
                                "assets/images/icon_sp.png",
                                onTap:
                                    () => Get.toNamed(
                                      Routes.SAFETY_PATROL_APPROVAL,
                                    ),
                              ),
                              if (GetStorage().read(GetStorageKey.namarole) ==
                                  'ADMIN HSE') ...[
                                buttonMenu(
                                  "List User",
                                  "assets/images/engineer.png",
                                  onTap: () => Get.toNamed(Routes.USER),
                                ),
                              ],
                              buttonMenu(
                                "List Work Permit",
                                "assets/images/engineer.png",
                                onTap: () => Get.toNamed(Routes.PERMIT),
                              ),
                              buttonMenu(
                                "Approval Work Permit",
                                "assets/images/engineer.png",
                              ),
                              buttonMenu(
                                "Laporan Aktivitas Harian",
                                "assets/images/engineer.png",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Popup Menu
          Obx(() {
            if (!controller.isPopupVisible.value)
              return const SizedBox.shrink();
            return Positioned(
              top: 80,
              left: 20,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 180),
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple[50],
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Ubah Profile'),
                          onTap: () {
                            controller.hidePopup();
                            Get.toNamed(Routes.PROFILE);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          onTap: () {
                            controller.hidePopup();
                            GetStorage().erase();
                            Get.offAllNamed(Routes.LOGIN);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
