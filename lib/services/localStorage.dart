import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soldiers_friends/model/users_model.dart';

class LocalDataStorage extends GetxController {
  static LocalDataStorage? _instance;
  static LocalDataStorage get getInstance => _instance ??= LocalDataStorage();
  late SharedPreferences _pref;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static RxString username = ''.obs;
  static RxString userEmail = ''.obs;
  static RxString userDOB = ''.obs;
  static RxString userImage = ''.obs;
  static RxString userPhone = ''.obs;
  static RxString userBio = ''.obs;
  static RxString usercountry = ''.obs;
  static RxString currentUserId = ''.obs;

  Future<void> insertUserData(UserModel userData) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString('id', userData.id.toString());
    await prefs.setString('fullName', userData.name);
    await prefs.setString('email', userData.email);
    await prefs.setString('phonenumber', userData.phonenumber);
    await prefs.setString('bio', userData.bio);
    await prefs.setString('DOB', userData.DOB);
    await prefs.setString('country', userData.country);

    username.value = userData.name;
    userPhone.value = userData.phonenumber;
    userEmail.value = userData.email;
    userBio.value = userData.bio;
    userDOB.value = userData.DOB;
    usercountry.value = userData.country;
    currentUserId.value = userData.id.toString();
  }

  // insertDeviceAndFCMInformation({FcmToken, deviceID}) async {
  //   final SharedPreferences? prefs = await _prefs;
  //   await prefs?.setString('fcmToken', FcmToken);
  //   await prefs?.setString('DeviceID', deviceID);

  //   fcmToken.value = FcmToken;
  //   DeviceID.value = deviceID;
  // }

  // updateUserData({username, fullname, photo}) async {
  //   final SharedPreferences? prefs = await _prefs;

  //   if (photo != "") {
  //     await prefs?.setString('photo', photo);

  //     userImage.value = photo;
  //   } else if (username != '') {
  //     await prefs?.setString('fullName', fullname);
  //     await prefs?.setString('userName', username);

  //     username.value = username;
  //     us.value = fullname;
  //   }
  // }

  getUserData() async {
    final SharedPreferences? prefs = await _prefs;
    currentUserId.value = prefs?.getString('id') ?? "";
    username.value = prefs?.getString('fullName') ?? "";
    userEmail.value = prefs?.getString('email') ?? "";
    userBio.value = prefs?.getString('bio') ?? "";
    userDOB.value = prefs?.getString('DOB') ?? "";
    usercountry.value = prefs?.getString('country') ?? "";
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    currentUserId.value = "";
    username.value = "";
    userEmail.value = "";
    userBio.value = "";
    userDOB.value = "";
    usercountry.value = "";
  }
}
