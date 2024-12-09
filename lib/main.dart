import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/firebase_options.dart';
import 'package:soldiers_friends/notificationService/localNotification.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/services/emailsender.dart';
import 'package:soldiers_friends/notificationService/fcmToken.dart';
import 'routes/routes_page_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await supabse_DB.getInstance.supabase_init();
  await FirebaseDB.init(); //---for FcmToken

  emailSender.getInstance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'A Soldiers Friends',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          getPages: RoutesPageList.routList,
          initialRoute: Get.routing.current.isEmpty
              ? RoutesName.getstartedPage
              : Get.currentRoute,
        );
      },
    );
  }
}
