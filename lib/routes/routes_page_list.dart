import 'package:get/get.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/view/FriendList/friendList_view.dart';
import 'package:soldiers_friends/view/FriendList/friendlist_binding.dart';
import 'package:soldiers_friends/view/blocklist/blocklist_binding.dart';
import 'package:soldiers_friends/view/blocklist/blocklist_view.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_binding.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
import 'package:soldiers_friends/view/changePassword/changepassword_binding.dart';
import 'package:soldiers_friends/view/changePassword/changepassword_view.dart';
import 'package:soldiers_friends/view/chat/chat_binding.dart';
import 'package:soldiers_friends/view/chat/chat_view.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_binding.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_view.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_binding.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_view.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_view.dart';
import 'package:soldiers_friends/view/forgotPassword/verificationScreen.dart';
import 'package:soldiers_friends/view/friend%20detail/friendDetails_bindings.dart';
import 'package:soldiers_friends/view/friend%20detail/friendDetails_controller.dart';
import 'package:soldiers_friends/view/friend%20detail/friendDetails_view.dart';
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
import 'package:soldiers_friends/view/resetPassword/resetpassword_binding.dart';
import 'package:soldiers_friends/view/resetPassword/resetpassword_view.dart';
import 'package:soldiers_friends/view/settings/settings_binding.dart';
import 'package:soldiers_friends/view/settings/settings_view.dart';
import 'package:soldiers_friends/view/sign_up/signup_binding.dart';
import 'package:soldiers_friends/view/sign_up/signup_view.dart';
import 'package:soldiers_friends/view/home/home_binding.dart';
import 'package:soldiers_friends/view/home/home_view.dart';
import 'package:soldiers_friends/view/sign_up/uploadProfilePicture.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtio_screens/purchase_screen.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtio_screens/subscribtion_view.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtion_binding.dart';
import 'package:soldiers_friends/view/forgotPassword/forgotPassword_binding.dart';
import 'package:soldiers_friends/view/forgotPassword/forgotPassword_view.dart';
import 'package:soldiers_friends/view/user%20details/userDetails_bindings.dart';
import 'package:soldiers_friends/view/user%20details/userDetails_view.dart';
import 'package:soldiers_friends/view/user_verification/emailverification_view.dart';
import 'package:soldiers_friends/view/user_verification/userVerification_binding.dart';

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
        name: RoutesName.loginPage,
        page: () => purchaseScreen(),
        binding: SubscribtionBinding()),
        
    GetPage(
        name: RoutesName.signuppage,
        page: () => SignupPage(),
        binding: SignUpBinding()),
    GetPage(
        name: RoutesName.uploadprofilepictureview,
        page: () => uploadProfilePictureView(),
        binding: SignUpBinding()),
    // GetPage(
    //     name: RoutesName.usephonepage,
    //     page: () => forgotPasswordView(),
    //     binding: ForgotPasswordBinding()),
    GetPage(
        name: RoutesName.profilepage,
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
        arguments: FriendsModel,
        name: RoutesName.chatdetails,
        page: () => ChatOpenScreen(
              userData: Get.arguments,
            ),
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
    GetPage(
        name: RoutesName.changepasswordview,
        page: () => changePasswordView(),
        binding: ChangePasswordBinding()),
    GetPage(
        arguments: {
          'data': homeModel,
          'isMylike': int,
        },
        name: RoutesName.userdetailview,
        page: () => UserDetailView(
              data: Get.arguments['data'],
              isMylike: Get.arguments['isMylike'],
            ),
        binding: UserDetailsBinding()),
    GetPage(
        name: RoutesName.friendlistview,
        page: () => FriendListView(),
        binding: FriendListBinding()),
    GetPage(
        arguments: FriendsModel,
        name: RoutesName.frienddetailview,
        page: () => FriendDetailView(
              data: Get.arguments,
            ),
        binding: FriendDetailsBinding()),
    GetPage(
        name: RoutesName.blocklistview,
        page: () => blockListView(),
        binding: BlockListBinding()),
    GetPage(
        arguments: {'type': String},
        name: RoutesName.forgotpasswordpage,
        page: () => forgotPasswordView(
              type: Get.arguments['type'],
            ),
        binding: ForgotPasswordBinding()),
    GetPage(
        arguments: {'email': String, 'type': String},
        name: RoutesName.otpVerification,
        page: () => otpVerificationScreen(
              email: Get.arguments['email'],
              type: Get.arguments['type'],
            ),
        binding: ForgotPasswordBinding()),
    GetPage(
        arguments: {'email': String, 'type': String},
        name: RoutesName.resetpasswordview,
        page: () => ResetPasswordView(
              email: Get.arguments['email'],
              type: Get.arguments['type'],
            ),
        binding: ResetPasswordBinding()),
  ];
}
