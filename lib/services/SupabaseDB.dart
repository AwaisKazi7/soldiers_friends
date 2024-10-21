import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soldiers_friends/model/users_model.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class supabse_DB {
  static supabse_DB? _instance;
  static supabse_DB get getInstance => _instance ??= supabse_DB();
  supabase_init() async {
    await Supabase.initialize(
      url: 'https://njxqtpmtoslpyhwuatxl.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5qeHF0cG10b3NscHlod3VhdHhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjkyNDYzNjgsImV4cCI6MjA0NDgyMjM2OH0.THN-5C3-t_Fqu--mCXJjpcSx1wC2LVRhcYtJ8bVD8nU',
    );

    print('Supabase successfully connected 🤑');
  }

  login(BuildContext context, String email, String Password) async {
    try {
      var userdata = await Supabase.instance.client
          .from('users_table')
          .select("*")
          .eq('email', email);
      if (userdata.isNotEmpty) {
        UserModel User = UserModel.fromMap(userdata.first);
        if (User.password == Password) {
          print("login 👌✅");
          print(User);
          await LocalDataStorage.getInstance.insertUserData(User);
          print('UserId : ${User.id}');
          print('User email : ${User.email}');
          Get.offAllNamed(RoutesName.bottomnavbar);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid Password'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not Found'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {}
  }

  registerUser(String fullname, String phonenumber, String email,
      String Password) async {
    try {
      var data = await Supabase.instance.client.from('users_table').insert([
        {
          'name': fullname,
          'phonenumber': phonenumber,
          'email': email,
          'password': Password,
        }
      ]).select('*');
      print("registerUser 👌✅");
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

  Delete_user(BuildContext context, String Password) async {
    try {
      var userdata = await Supabase.instance.client
          .from('users_table')
          .select("*")
          .eq('id', LocalDataStorage.currentUserId.value);

      UserModel User = UserModel.fromMap(userdata.first);

      if (User.password == Password) {
        var data = await Supabase.instance.client
            .from('users_table')
            .delete()
            .eq('id', LocalDataStorage.currentUserId.value);

        print("Delete_user 👌✅");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your account has been deleted successfully.'),
            backgroundColor: Colors.green,
          ),
        );
        LocalDataStorage.getInstance.logout();
        Get.offAllNamed(RoutesName.loginPage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password Doesn't Match"),
            backgroundColor: Colors.red,
          ),
        );
      }

      return true;
    } catch (e) {
      print('Delete_user Error: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete account: ${e}'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
