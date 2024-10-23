import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
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
          .select('*,profilepicture_table(*)')
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

  registerUser(BuildContext context, String fullname, String phonenumber,
      String email, String Password) async {
    try {
      var data = await Supabase.instance.client
          .from('users_table')
          .insert([
            {
              'name': fullname,
              'phonenumber': phonenumber,
              'email': email,
              'password': Password,
            }
          ])
          .eq('email', email)
          .select('*,profilepicture_table(*)');

      print("registerUser 👌✅");
      print(data);
      UserModel User = UserModel.fromMap(data.last);
      await LocalDataStorage.getInstance.insertUserData(User);
      print('UserId : ${User.id}');
      print('User email : ${User.email}');

      return true;
    } catch (e) {
      print('insert_userDetails Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: $e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  Delete_user(BuildContext context, String Password) async {
    try {
      var userdata = await Supabase.instance.client
          .from('users_table')
          .select('*, profilepicture_table(*)')
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

  ChangePassword(
      BuildContext context, String OldPassword, String NewPassword) async {
    try {
      var userdata = await Supabase.instance.client
          .from('users_table')
          .select('*, profilepicture_table(*)')
          .eq('id', LocalDataStorage.currentUserId.value);

      UserModel User = UserModel.fromMap(userdata.first);

      if (User.password == OldPassword) {
        var data = await Supabase.instance.client
            .from('users_table')
            .update({'password': NewPassword}).eq(
                'id', LocalDataStorage.currentUserId.value);
        print("ChangePassword 👌✅");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your Password has been updated successfully.'),
            backgroundColor: Colors.green,
          ),
        );

        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Old Password is invalid"),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    } catch (e) {
      print('ChangePassword Error: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to updated Password'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  editProfile(BuildContext context, String fullname, String phonenumber,
      String Bio, String DOB, String country, List<File?> images) async {
    try {
      // Prepare the updated data
      var updatedData = {
        'name': fullname,
        'phonenumber': phonenumber,
        'DOB': DOB,
        'bio': Bio,
        'country': country
      };

      // Update the user profile in the database
      var data = await Supabase.instance.client
          .from('users_table')
          .update(updatedData)
          .eq('id', LocalDataStorage.currentUserId.value)
          .select('*, profilepicture_table(*)');

      print("editProfile 👌✅");
      print(data);

      if (data.isNotEmpty) {
        UserModel user = UserModel.fromMap(data.last);
        await LocalDataStorage.getInstance.updateUserData(
            fullname: user.name,
            phone: user.phonenumber,
            DOB: user.DOB,
            bio: user.bio,
            Country: user.country);

        print('Updated UserId: ${user.id}');
        print('Updated User email: ${user.email}');

        // final List<String> fileUrls = await Future.wait(images.map((e) async {
        //   String fileName =
        //       'userProfile/${DateTime.now().millisecondsSinceEpoch}-${e}';

        //   final response = await Supabase.instance.client.storage
        //       .from('soliderbucket')
        //       .upload(fileName, e.);

        //   return Supabase.instance.client.storage
        //       .from('soliderbucket')
        //       .getPublicUrl(fileName);
        // }).toList());

        // print('Uploaded file URLs: $fileUrls');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile Updated successfully.'),
            backgroundColor: Colors.green,
          ),
        );
      }

      return true;
    } catch (e) {
      print('editProfile Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating profile.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  GetAllUser() async {
    try {
      var data = await Supabase.instance.client
          .from('users_table')
          .select('*, profilepicture_table(*)');

      print("GetAllUser 👌✅");
      print(data);

      if (data.isNotEmpty) {
        List<homeModel> UsersList = data
            .map(
              (e) => homeModel.fromMap(e),
            )
            .toList();

        print('User Count: ${UsersList.length}');
        return UsersList;
      } else {}
      return [];
    } catch (e) {
      print('GetAllUser Error: $e');
      return [];
    }
  }

  GetLikeUsers() async {
    try {
      List<homeModel> myLikesList = [];
      List<homeModel> likesMeList = [];
      // STEP 1:

      //Fetch the liked user IDs
      final likedResponse =
          await Supabase.instance.client.from('like_table').select('*');

      //Fetch All users
      final userResponse = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)');

      if (likedResponse.isNotEmpty) {
        //----getting Ids of those users whom i like
        final likedUserIds = (likedResponse as List<dynamic>)
            .where(
              (e) =>
                  e['liked_by_userId'] == LocalDataStorage.currentUserId.value,
            )
            .map((item) => item['liked_userId'])
            .toList();

        //----getting Data of those users whom i like
        for (final userId in likedUserIds) {
          final userData = (userResponse as List<dynamic>).firstWhere(
            (e) => e['id'] == userId,
          );
          homeModel data = homeModel.fromMap(userData);
          myLikesList.add(data);
        }

        //----getting Ids of those users who like me
        final mylikes_UserIds = (likedResponse as List<dynamic>)
            .where(
              (e) => e['liked_userId'] == LocalDataStorage.currentUserId.value,
            )
            .map((item) => item['liked_by_userId'])
            .toList();

        //----getting Data of those users who like me
        for (final userId in mylikes_UserIds) {
          final userData = (userResponse as List<dynamic>).firstWhere(
            (e) => e['id'] == userId,
          );

          homeModel data = homeModel.fromMap(userData);
          likesMeList.add(data);
        }

        print('GetLikeUsers 👌✅');
        print({
          'myLikesList': myLikesList.length,
          'likesMeList': likesMeList.length
        });
      }
      return {'myLikesList': myLikesList, 'likesMeList': likesMeList};
    } catch (e) {
      print('GetAllUser Error: $e');
      return {'myLikesList': [], 'likesMeList': []};
    }
  }

  likeApi(BuildContext context, int userId) async {
    try {
      var data = await Supabase.instance.client.from('like_table').insert([
        {
          'liked_userId': userId,
          'liked_by_userId': LocalDataStorage.currentUserId.value,
        }
      ]);

      print("likeApi 👌✅");

      return true;
    } catch (e) {
      print('insert_userDetails Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: $e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
