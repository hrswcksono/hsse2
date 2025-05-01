import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/routes/app_pages.dart';

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
                        child: Icon(Icons.menu, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Selamat datang, Staff HSE!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.notifications_none),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        _tile(
                          "Formulir Work Permit",
                          "assets/images/engineer.png",
                        ),
                        _tile("List Work Permit", "assets/images/engineer.png"),
                        _tile(
                          "Formulir Safety Briefing",
                          "assets/images/engineer.png",
                        ),
                        _tile(
                          "Formulir Safety Patrol",
                          "assets/images/engineer.png",
                        ),
                        _tile(
                          "Formulir Starr Card",
                          "assets/images/engineer.png",
                        ),
                        _tile("Aktivitas Harian", "assets/images/engineer.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Popup
          Obx(() {
            if (!controller.isPopupVisible.value) return SizedBox.shrink();
            return Positioned(
              top: 80,
              left: 20,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 180, // ✅ prevent infinite width error
                ),
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple[50],
                  child: IntrinsicWidth(
                    // ✅ allows width to fit content within constraints
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Ubah Profile'),
                          onTap: () {
                            controller.hidePopup();
                            Get.toNamed(Routes.PROFILE);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () {
                            controller.hidePopup();
                            Get.toNamed(Routes.LOGIN);
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

  Widget _tile(String label, String asset) {
    return GestureDetector(
      onTap: () => print("Tapped: $label"),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: Image.asset(asset, fit: BoxFit.contain)),
            SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
