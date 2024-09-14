import 'package:get/get.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_binding.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_password_binding.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_password_view.dart';
import 'package:soldiers_friends/view/get_started/get_started_binding.dart';
import 'package:soldiers_friends/view/get_started/get_started_view.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/login/login_binding.dart';
import 'package:soldiers_friends/view/login/login_view.dart';
import 'package:soldiers_friends/view/profile/profile-binding.dart';
import 'package:soldiers_friends/view/profile/profile_view.dart';
import 'package:soldiers_friends/view/sign_up/signup_binding.dart';
import 'package:soldiers_friends/view/sign_up/signup_view.dart';
import 'package:soldiers_friends/view/swipe_profile/home_binding.dart';
import 'package:soldiers_friends/view/swipe_profile/home_view.dart';
import 'package:soldiers_friends/view/use_phoneNo/use_phone_binding.dart';
import 'package:soldiers_friends/view/use_phoneNo/use_phone_view.dart';

class RoutesPageList {
  static List<GetPage> routList = [
    GetPage(
        name: RoutesName.getstartedPage,
        page: () => const GetStartedView(),
        binding: GetStartedBinding()),
    GetPage(
        name: RoutesName.loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: RoutesName.signuppage,
        page: () => const SignupPage(),
        binding: SignUpBinding()),
    GetPage(
        name: RoutesName.forgotpasswordpage,
        page: () => const ForgotPasswordPage(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: RoutesName.usephonepage,
        page: () => UsePhoneView(),
        binding: CountryCodeBinding()),
    GetPage(
        name: RoutesName.profilePage,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: RoutesName.homepage,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: RoutesName.bottomnavbar,
        page: () => const BottomNavbarView(),
        binding: BottomNavbarBinding()),
  ];
}
