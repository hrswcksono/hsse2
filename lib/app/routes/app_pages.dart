import 'package:get/get.dart';

import '../middlewares/login_middlewares.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan_ah/bindings/laporan_ah_binding.dart';
import '../modules/laporan_ah/views/laporan_ah_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/safety_brief/bindings/safety_brief_binding.dart';
import '../modules/safety_brief/views/safety_brief_view.dart';
import '../modules/safety_brief_form/bindings/safety_brief_form_binding.dart';
import '../modules/safety_brief_form/views/safety_brief_form_view.dart';
import '../modules/ubah_password/bindings/ubah_password_binding.dart';
import '../modules/ubah_password/views/ubah_password_view.dart';
import '../modules/unsafe_action/bindings/unsafe_action_binding.dart';
import '../modules/unsafe_action/views/unsafe_action_view.dart';
import '../modules/unsafe_action_detail/bindings/unsafe_action_detail_binding.dart';
import '../modules/unsafe_action_detail/views/unsafe_action_detail_view.dart';
import '../modules/unsafe_action_form/bindings/unsafe_action_form_binding.dart';
import '../modules/unsafe_action_form/views/unsafe_action_form_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/user_form/bindings/user_form_binding.dart';
import '../modules/user_form/views/user_form_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_PASSWORD,
      page: () => const UbahPasswordView(),
      binding: UbahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.UNSAFE_ACTION,
      page: () => UnsafeActionView(),
      binding: UnsafeActionBinding(),
    ),
    GetPage(
      name: _Paths.UNSAFE_ACTION_FORM,
      page: () => UnsafeActionFormView(),
      binding: UnsafeActionFormBinding(),
    ),
    GetPage(
      name: _Paths.UNSAFE_ACTION_DETAIL,
      page: () => const UnsafeActionDetailView(),
      binding: UnsafeActionDetailBinding(),
    ),
    GetPage(
      name: _Paths.SAFETY_BRIEF,
      page: () => const SafetyBriefView(),
      binding: SafetyBriefBinding(),
    ),
    GetPage(
      name: _Paths.SAFETY_BRIEF_FORM,
      page: () => const SafetyBriefFormView(),
      binding: SafetyBriefFormBinding(),
    ),
    GetPage(
      name: _Paths.USER_FORM,
      page: () => const UserFormView(),
      binding: UserFormBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_AH,
      page: () => const LaporanAhView(),
      binding: LaporanAhBinding(),
    ),
  ];
}
