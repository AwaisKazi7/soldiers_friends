import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  final String chatName = "John Doe";

  final List<Map<String, dynamic>> messages = [
    {"text": "Hello", "image": null},
    {"text": "Check this out!", "image": "https://via.placeholder.com/150"},
    {"text": "How are you?", "image": null},
    {"text": "I'm doing great, thanks!", "image": null},
    {"text": "What about you?", "image": "https://via.placeholder.com/150"},
    {"text": "I'm fine too. Let's catch up soon!", "image": null}
  ];
  @override
  void onReady() {
    super.onReady();
    // Uncomment if you want to navigate when the controller is ready
    // navigate();
  }

  // Future<void> navigate() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.offAndToNamed(RoutesName.getstartedPage);
  // }
}
