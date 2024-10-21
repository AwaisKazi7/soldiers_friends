import 'package:get/get.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_binding.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
import 'package:soldiers_friends/view/chat/chat_binding.dart';
import 'package:soldiers_friends/view/chat/chat_view.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_binding.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_view.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_binding.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_view.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_view.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_password_binding.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_password_view.dart';
import 'package:soldiers_friends/view/get_started/get_started_binding.dart';
import 'package:soldiers_friends/view/get_started/get_started_view.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/likes/likes_binding.dart';
import 'package:soldiers_friends/view/likes/likes_view.dart';
import 'package:soldiers_friends/view/login/login_binding.dart';
import 'package:soldiers_friends/view/login/login_view.dart';
import 'package:soldiers_friends/view/profile/profile_binding.dart';
import 'package:soldiers_friends/view/profile/profile_view.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_binding.dart';
import 'package:soldiers_friends/view/settings/settings_binding.dart';
import 'package:soldiers_friends/view/settings/settings_view.dart';
import 'package:soldiers_friends/view/sign_up/signup_binding.dart';
import 'package:soldiers_friends/view/sign_up/signup_view.dart';
import 'package:soldiers_friends/view/home/home_binding.dart';
import 'package:soldiers_friends/view/home/home_view.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtio_screens/subscribtion_view.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtion_binding.dart';
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
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: RoutesName.signuppage,
        page: () => SignupPage(),
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
        name: RoutesName.editprofile,
        page: () => EditProfileView(),
        binding: EditProfileBinding()),
    GetPage(
        name: RoutesName.homepage,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: RoutesName.likespage,
        page: () => const LikesView(),
        binding: LikesBinding()),
    GetPage(
        name: RoutesName.bottomnavbar,
        page: () => const NavBarScreen(),
        binding: BottomNavbarBindings()),
    GetPage(
        name: RoutesName.chatpage,
        page: () => const ChatView(),
        binding: ChatBinding()),
    GetPage(
        name: RoutesName.chatdetails,
        page: () => ChatOpenScreen(),
        binding: ChatDetailBinding()),
    GetPage(
        name: RoutesName.subscribtion,
        page: () => const SubscribtionView(),
        binding: SubscribtionBinding()),
    GetPage(
        name: RoutesName.settingview,
        page: () => const SettingView(),
        
        binding: SettingBinding()),
    GetPage(
        name: RoutesName.deleteview,
        page: () => const DeleteAccountView(),
        binding: DeleteAccountBinding()),
  ];
}
