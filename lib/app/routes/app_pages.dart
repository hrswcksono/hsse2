import 'package:get/get.dart';

import '../middlewares/login_middlewares.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan_ah/bindings/laporan_ah_binding.dart';
import '../modules/laporan_ah/views/laporan_ah_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/permit/bindings/permit_binding.dart';
import '../modules/permit/views/permit_view.dart';
import '../modules/permit_approve/bindings/permit_approve_binding.dart';
import '../modules/permit_approve/views/permit_approve_view.dart';
import '../modules/permit_detail/bindings/permit_detail_binding.dart';
import '../modules/permit_detail/views/permit_detail_view.dart';
import '../modules/permit_form/bindings/permit_form_binding.dart';
import '../modules/permit_form/views/permit_form_view.dart';
import '../modules/permit_jenis/bindings/permit_jenis_binding.dart';
import '../modules/permit_jenis/views/permit_jenis_view.dart';
import '../modules/permit_list/bindings/permit_list_binding.dart';
import '../modules/permit_list/views/permit_list_view.dart';
import '../modules/permit_selesai/bindings/permit_selesai_binding.dart';
import '../modules/permit_selesai/views/permit_selesai_view.dart';
import '../modules/permit_soal/bindings/permit_soal_binding.dart';
import '../modules/permit_soal/views/permit_soal_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/rekap_permit/bindings/rekap_permit_binding.dart';
import '../modules/rekap_permit/views/rekap_permit_view.dart';
import '../modules/rekap_sb/bindings/rekap_sb_binding.dart';
import '../modules/rekap_sb/views/rekap_sb_view.dart';
import '../modules/rekap_sp/bindings/rekap_sp_binding.dart';
import '../modules/rekap_sp/views/rekap_sp_view.dart';
import '../modules/safety_brief/bindings/safety_brief_binding.dart';
import '../modules/safety_brief/views/safety_brief_view.dart';
import '../modules/safety_brief_detail/bindings/safety_brief_detail_binding.dart';
import '../modules/safety_brief_detail/views/safety_brief_detail_view.dart';
import '../modules/safety_brief_form/bindings/safety_brief_form_binding.dart';
import '../modules/safety_brief_form/views/safety_brief_form_view.dart';
import '../modules/safety_patrol/bindings/safety_patrol_binding.dart';
import '../modules/safety_patrol/views/safety_patrol_view.dart';
import '../modules/safety_patrol_approval/bindings/safety_patrol_approval_binding.dart';
import '../modules/safety_patrol_approval/views/safety_patrol_approval_view.dart';
import '../modules/ubah_password/bindings/ubah_password_binding.dart';
import '../modules/ubah_password/views/ubah_password_view.dart';
import '../modules/unsafe_action/bindings/unsafe_action_binding.dart';
import '../modules/unsafe_action/views/unsafe_action_view.dart';
import '../modules/unsafe_action_approal/bindings/unsafe_action_approal_binding.dart';
import '../modules/unsafe_action_approal/views/unsafe_action_approal_view.dart';
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
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
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
      page: () => UnsafeActionDetailView(),
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
    GetPage(
      name: _Paths.SAFETY_PATROL,
      page: () => SafetyPatrolView(),
      binding: SafetyPatrolBinding(),
    ),
    GetPage(
      name: _Paths.SAFETY_PATROL_APPROVAL,
      page: () => const SafetyPatrolApprovalView(),
      binding: SafetyPatrolApprovalBinding(),
    ),
    GetPage(
      name: _Paths.UNSAFE_ACTION_APPROAL,
      page: () => UnsafeActionApproalView(),
      binding: UnsafeActionApproalBinding(),
    ),
    GetPage(
      name: _Paths.SAFETY_BRIEF_DETAIL,
      page: () => SafetyBriefDetailView(),
      binding: SafetyBriefDetailBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT,
      page: () => PermitView(),
      binding: PermitBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_JENIS,
      page: () => const PermitJenisView(),
      binding: PermitJenisBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_LIST,
      page: () => PermitListView(),
      binding: PermitListBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_SOAL,
      page: () => const PermitSoalView(),
      binding: PermitSoalBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_DETAIL,
      page: () => PermitDetailView(),
      binding: PermitDetailBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_FORM,
      page: () => PermitFormView(),
      binding: PermitFormBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_APPROVE,
      page: () => PermitApproveView(),
      binding: PermitApproveBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT_SELESAI,
      page: () => PermitSelesaiView(),
      binding: PermitSelesaiBinding(),
    ),
    GetPage(
      name: _Paths.REKAP_SB,
      page: () => const RekapSbView(),
      binding: RekapSbBinding(),
    ),
    GetPage(
      name: _Paths.REKAP_SP,
      page: () => const RekapSpView(),
      binding: RekapSpBinding(),
    ),
    GetPage(
      name: _Paths.REKAP_PERMIT,
      page: () => const RekapPermitView(),
      binding: RekapPermitBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
  ];
}
