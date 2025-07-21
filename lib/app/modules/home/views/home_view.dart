import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';
import '../../../widgets/global_widget.dart';
import '../controllers/home_controller.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A89D),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text("Tekan sekali lagi untuk keluar"),
        ),
        child: Stack(
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
                                if (
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'PEKERJA / SUB KONTRAKTOR')
                                  buttonMenu(
                                    "Form Safety Briefing",
                                    "assets/images/icon_form_sb.png",
                                    onTap:
                                        () =>
                                            Get.toNamed(Routes.SAFETY_BRIEF_FORM),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE')
                                  buttonMenu(
                                    "Safety Briefing",
                                    "assets/images/icon_sb.png",
                                    onTap: () => Get.toNamed(Routes.SAFETY_BRIEF),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE')
                                  buttonMenu(
                                    "Form Safety Patrol",
                                    "assets/images/icon_form_sp.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.SAFETY_PATROL,
                                          arguments: {"asal": "form"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'SPV HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE')
                                  buttonMenu(
                                    "Safety Patrol",
                                    "assets/images/icon_sp.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.SAFETY_PATROL,
                                          arguments: {"asal": "list"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                    'SPV HSE')
                                  buttonMenu(
                                    "Approval Safety Patrol",
                                    "assets/images/icon_sp.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.SAFETY_PATROL,
                                          arguments: {"asal": "approve"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'PEKERJA / SUB KONTRAKTOR')
                                  buttonMenu(
                                    "Formulir Work Permit",
                                    "assets/images/icon_form_work_permit.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.PERMIT,
                                          arguments: {"asal": "form"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'SPV AREA' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'SPV HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'MANAJER' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'PEKERJA / SUB KONTRAKTOR')
                                  buttonMenu(
                                    "List Work Permit",
                                    "assets/images/icon_list_work_permit.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.PERMIT,
                                          arguments: {"asal": "list"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'SPV AREA' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'SPV HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'MANAJER')
                                  buttonMenu(
                                    "Approval Work Permit",
                                    "assets/images/icon_list_approve_wp.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.PERMIT,
                                          arguments: {"asal": "approve"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                    'ADMIN HSE')
                                  buttonMenu(
                                    "Work Permit",
                                    "assets/images/engineer.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.PERMIT,
                                          arguments: {"asal": "list"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                    'ADMIN HSE')
                                  buttonMenu(
                                    "Safety Briefing",
                                    "assets/images/icon_sb.png",
                                    onTap: () => Get.toNamed(Routes.SAFETY_BRIEF),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                    'ADMIN HSE')
                                  buttonMenu(
                                    "Safety Patrol",
                                    "assets/images/icon_sp.png",
                                    onTap:
                                        () => Get.toNamed(
                                          Routes.SAFETY_PATROL,
                                          arguments: {"asal": "list"},
                                        ),
                                  ),
                                if (GetStorage().read(GetStorageKey.namarole) ==
                                        'ADMIN HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'SPV HSE' ||
                                    GetStorage().read(GetStorageKey.namarole) ==
                                        'STAFF HSE')
                                  buttonMenu(
                                    "Laporan Aktivitas Harian",
                                    "assets/images/icon_lah.png",
                                    onTap: () => Get.toNamed(Routes.LAPORAN_AH),
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
        
              return Stack(
                children: [
                  // ✅ Layer transparan untuk menutup popup saat klik di luar
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => controller.hidePopup(),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
        
                  // ✅ Popup tombol melayang
                  Positioned(
                    top: 40,
                    left: 0,
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.purple[50],
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.hidePopup();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Icon(Icons.menu, size: 24),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.hidePopup();
                                Get.toNamed(Routes.PROFILE);
                              },
                              child: Column(
                                children: const [
                                  Icon(Icons.person, size: 20),
                                  SizedBox(height: 4),
                                  Text(
                                    'Ubah Profile',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ),
                            if (GetStorage().read(GetStorageKey.namarole) ==
                                'ADMIN HSE')
                              InkWell(
                                onTap: () {
                                  controller.hidePopup();
                                  Get.toNamed(Routes.USER);
                                },
                                child: Column(
                                  children: const [
                                    Icon(Icons.people, size: 20),
                                    SizedBox(height: 4),
                                    Text(
                                      'Manage Akun',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(height: 12),
                                  ],
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                controller.hidePopup();
                                GetStorage().erase();
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: Column(
                                children: const [
                                  Icon(Icons.logout, size: 20),
                                  SizedBox(height: 4),
                                  Text('Logout', style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
