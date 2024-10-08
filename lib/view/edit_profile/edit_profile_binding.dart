import 'package:get/get.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }
}
