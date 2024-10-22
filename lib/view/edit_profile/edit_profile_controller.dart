import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getuserData();
  }

  final formkey = GlobalKey<FormState>();

  RxList<File?> imagesList = <File?>[].obs;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final BioController = TextEditingController();
  final CountryController = TextEditingController();
  final DOBController = TextEditingController();

  final FocusNode NameFocusNode = FocusNode();
  final FocusNode PhoneFocusNode = FocusNode();
  final FocusNode BioFocusNode = FocusNode();
  final FocusNode DOBFocusNode = FocusNode();
  final FocusNode countryFocusNode = FocusNode();

  RxBool apihitting = false.obs;

  getuserData() {
    nameController.text = LocalDataStorage.username.value;
    BioController.text = LocalDataStorage.userBio.value;
    DOBController.text = LocalDataStorage.userDOB.value;
    CountryController.text = LocalDataStorage.usercountry.value;
  }

  editProfile(BuildContext context) async {
    try {
      apihitting.value = true;
      await supabse_DB.getInstance.editProfile(
          context,
          nameController.text,
          phoneController.text,
          BioController.text,
          DOBController.text,
          CountryController.text,
          imagesList);
      apihitting.value = false;
      return true;
    } catch (e) {
      // Generic error handling for any other exceptions
      print('Error: $e');
      apihitting.value = false;
      return false;
    }
  }
}
