import 'package:get/get.dart';
import 'package:soldiers_friends/view/get_started/get_started_binding.dart';
import 'package:soldiers_friends/view/get_started/get_started_view.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';

class RoutesPageList {
  static List<GetPage> routList = [
    GetPage(
        name: RoutesName.getstartedPage,
        page: () => const GetStartedView(),
        binding: GetStartedBinding()),
  ];
}
