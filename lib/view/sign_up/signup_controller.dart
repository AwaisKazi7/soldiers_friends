import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/users_model.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  final formkey = GlobalKey<FormState>();

  final fullnameController = TextEditingController();
  final EmailController = TextEditingController();
  final phoneController = TextEditingController();
  final PassowrdController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FocusNode NameFocusNode = FocusNode();
  final FocusNode EmailFocusNode = FocusNode();
  final FocusNode PhoneFocusNode = FocusNode();
  final FocusNode PasswordFocusNode = FocusNode();
  final FocusNode ConfirmPasswordFocusNode = FocusNode();

  RxBool apihitting = false.obs;

  Future signUpWithEmailAndPhone(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await insert_userDetails();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print('Sign up failed: ${e.message}');
      return false;
    } catch (e) {
      print('Sign up failed: ${e.toString()}');
      return false;
    }
  }

  insert_userDetails() async {
    try {
      var data = await Supabase.instance.client.from('users_table').insert([
        {
          'name': fullnameController.text,
          'phonenumber': phoneController.text,
          'email': EmailController.text,
          'password': PassowrdController.text,
        }
      ]).select('*');
      print("insert_userDetails 👌✅");
      print(data);
      UserModel User = UserModel.fromMap(data.last);
      await LocalDataStorage.getInstance.insertUserData(User);
      print('UserId : ${User.id}');
      print('User email : ${User.email}');

      return true;
    } catch (e) {
      print('insert_userDetails Error: $e');
      return false;
    }
  }
}
