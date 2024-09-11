import 'package:get/get.dart';
import 'package:soldiers_friends/view/use_phoneNo/use_phone_controller.dart';

class CountryCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CountryCodeController>(CountryCodeController());
  }
}
