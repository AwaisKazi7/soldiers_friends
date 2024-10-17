import 'package:get/get.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_controller.dart';
import 'package:soldiers_friends/view/settings/settings_controller.dart';


class DeleteAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DeleteaccountController>(DeleteaccountController());
  }
}