import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/data/providers/base_provider.dart';
import 'package:hsse2/utils/values/colors.dart';

import 'app/routes/app_pages.dart';
import 'service/storage_service.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await FlutterDownloader.initialize(
    debug:
        true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl:
        true, // option: set to false to disable working with http links (default: false)
  );
  Get.lazyPut(() => StorageService());
  await initialConfig();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.LOGIN,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeData(
        // disabledColor: Colors.black38,
        scaffoldBackgroundColor: CustomColor.mainColor,
        inputDecorationTheme: InputDecorationTheme(
          errorMaxLines: 1,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.black,
          hintStyle: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
          contentPadding: const EdgeInsets.only(
            bottom: 10,
            top: 10,
            right: 20,
            left: 10,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            elevation: 0,
            textStyle: GoogleFonts.inter(color: Colors.white),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
  Get.lazyPut<BaseProvider>(() => BaseProvider());
}
