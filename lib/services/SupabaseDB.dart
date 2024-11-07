import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/model/messageModel.dart';
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

  Sociallogin(BuildContext context, String email, String name) async {
    try {
      var userdata = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)')
          .eq('email', email)
          .eq('isDelete', 0);

      if (userdata.isNotEmpty) {
        UserModel User = UserModel.fromMap(userdata.first);
        print("Sociallogin 👌✅");
        print(User);
        await LocalDataStorage.getInstance.insertUserData(User);
        print('UserId : ${User.id}');
        print('User email : ${User.email}');
        Get.offAllNamed(RoutesName.bottomnavbar);
      } else {
        var data = await Supabase.instance.client
            .from('users_table')
            .insert([
              {
                'name': name,
                'phonenumber': '',
                'email': email,
                'password': 'open1234#',
              }
            ])
            .eq('email', email)
            .select('*,profilepicture_table(*)');

        print("SocialregisterUser 👌✅");
        print(data);
        UserModel User = UserModel.fromMap(data.last);
        await LocalDataStorage.getInstance.insertUserData(User);
        print('UserId : ${User.id}');
        print('User email : ${User.email}');
        Get.offAllNamed(RoutesName.bottomnavbar);
      }
    } catch (e) {
      print('Sociallogin Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  login(BuildContext context, String email, String Password) async {
    try {
      var userdata = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)')
          .eq('email', email)
          .eq('isDelete', 0);

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
    } catch (e) {
      print('login Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
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
        var data = await Supabase.instance.client.from('users_table').update(
            {'isDelete': 1}).eq('id', LocalDataStorage.currentUserId.value);

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

  Block_user(BuildContext context, int chatId, int Action) async {
    try {
      await Supabase.instance.client
          .from('Conversation_table')
          .update({'isblocked': Action}).eq('id', chatId);

      print("Block_user 👌✅");

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Your account has been deleted successfully.'),
      //     backgroundColor: Colors.green,
      //   ),
      // );
      await GetconversationList();
      Get.toNamed(RoutesName.bottomnavbar);

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
            Country: user.country,
            image: user.images);

        print('Updated UserId: ${user.id}');
        print('Updated User email: ${user.email}');
        for (var element in images) {
          await uploadImage(element!);
        }

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

  Future<void> uploadImage(File imageFile) async {
    try {
      bool Upload = false;

      final response = await Supabase.instance.client.storage
          .from('soliderbucket') // Replace with your storage bucket name
          .upload('userProfile/${imageFile.path.split('/').last}', imageFile)
          .whenComplete(() {
        print('Image uploaded successfully');
        Upload = true;
      });

      if (Upload) {
        //-----getting image link from Storage
        final publicUrl = Supabase.instance.client.storage
            .from('soliderbucket')
            .getPublicUrl('userProfile/${imageFile.path.split('/').last}');

        print('Image uploaded successfully. URL: ${publicUrl}');

        //-----inserting image in database
        var data =
            await Supabase.instance.client.from('profilepicture_table').insert([
          {
            'imageUrl': publicUrl,
            'userId': LocalDataStorage.currentUserId.value,
          }
        ]);
      } else {
        print("Upload error: ${response}");
      }
    } catch (e) {
      print("Error In uploadImage: ${e}");
    }
  }

  sendMessage(int userId, String message, int mediaType, int chatId) async {
    try {
      if (mediaType == 0) {
        await Supabase.instance.client.from('chat_table').insert({
          'sender_id': int.parse(LocalDataStorage.currentUserId.value),
          'reciver_id': userId,
          'content': message,
          'media_type': mediaType,
          'chat_id': chatId
        });

        await Supabase.instance.client
            .from('Conversation_table')
            .update({'last_message': message}).eq('id', chatId);

        print("sendMessage 👌✅");
      } else {}

      return true;
    } catch (e) {
      print("Error In sendMessage: ${e}");
      return false;
    }
  }

  GetMessage() async {
    try {
      List<MessageModel> dataList = [];

      var response = await Supabase.instance.client
          .from('chat_table')
          .stream(primaryKey: ['id']).listen(
        (event) {
          for (var message in event) {
            dataList.add(MessageModel.fromJson(message));
          }
        },
      );

      print("GetMessage 👌✅");
      print(dataList);
      if (dataList != null) {
        return dataList;
      } else {
        print("Not Message found");

        return [];
      }
    } catch (e) {
      print("Error In sendMessage: ${e}");
      return [];
    }
  }

  GetAllUser() async {
    try {
      var data = await Supabase.instance.client
          .from('users_table')
          .select('*, profilepicture_table(*)')
          .eq('isDelete', 0)
          .neq('id', LocalDataStorage.currentUserId.value);

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
      var likedResponse = await Supabase.instance.client
          .from('like_table')
          .select('*')
          .eq('IsMatched', 0);

      //Fetch All users
      var userResponse = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)');

      if (likedResponse.isNotEmpty) {
        //----getting Ids of those users whom i like
        // List<int> likedUserIds = [];

        var likedUserIds = (likedResponse as List)
            .where(
              (e) =>
                  e['liked_by_userId'] ==
                  int.parse(LocalDataStorage.currentUserId.value),
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
        var mylikes_UserIds = (likedResponse as List<dynamic>)
            .where(
              (e) =>
                  e['liked_userId'] ==
                  int.parse(LocalDataStorage.currentUserId.value),
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
      var data = await Supabase.instance.client
          .from('like_table')
          .select('*')
          .eq('liked_userId', userId)
          .eq('liked_by_userId',
              int.parse(LocalDataStorage.currentUserId.value));

      if (data.isEmpty) {
        await Supabase.instance.client.from('like_table').insert([
          {
            'liked_userId': userId,
            'liked_by_userId': LocalDataStorage.currentUserId.value,
          }
        ]);

        print("likeApi 👌✅");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("This user is already in your likes list"),
            backgroundColor: Colors.red,
          ),
        );
      }
      return true;
    } catch (e) {
      print('likeApi Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: $e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  AddFriendApi(BuildContext context, int userId) async {
    try {
      var isexistcheck2 = await Supabase.instance.client
          .from('friends_table')
          .select('*')
          .eq('friend_userId', userId)
          .eq('userId', int.parse(LocalDataStorage.currentUserId.value));

      var isexistcheck1 = await Supabase.instance.client
          .from('friends_table')
          .select('*')
          .eq('userId', userId)
          .eq('friend_userId', int.parse(LocalDataStorage.currentUserId.value));

      if (isexistcheck2.isEmpty && isexistcheck1.isEmpty) {
        //---update like status
        await Supabase.instance.client.from('like_table').update({
          'IsMatched': 1
        }).or(
            'liked_userId.eq.${LocalDataStorage.currentUserId.value},liked_by_userId.eq.${LocalDataStorage.currentUserId.value}');

        //-------add Friend
        await Supabase.instance.client.from('friends_table').insert([
          {
            'friend_userId': userId,
            'userId': LocalDataStorage.currentUserId.value,
          }
        ]);

        print("AddFriend 👌✅");
        //-------add conversation
        await Supabase.instance.client.from('Conversation_table').insert([
          {
            'second_userId': userId,
            'first_userId': LocalDataStorage.currentUserId.value,
            'last_message': 'say Hi to your new friend'
          }
        ]);

        print("addconversation 👌✅");

        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("This user is already in your friends list"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('AddFriendApi Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: $e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  GetfriendsList() async {
    try {
      List<FriendsModel> FriendsList = [];
      List<Map<String, dynamic>> List_of_ids = [];

      // STEP 1:

      //Fetch the liked user IDs
      var FirstFriendResponse = await Supabase.instance.client
          .from('Conversation_table')
          .select('first_userId,id')
          .eq('second_userId', int.parse(LocalDataStorage.currentUserId.value))
          .eq('isblocked', 0);

      var SecondFriendResponse = await Supabase.instance.client
          .from('Conversation_table')
          .select('second_userId,id')
          .eq('first_userId', int.parse(LocalDataStorage.currentUserId.value))
          .eq('isblocked', 0);

      //Fetch All users
      var userResponse = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)');

      if (FirstFriendResponse.isNotEmpty) {
        for (final data in FirstFriendResponse) {
          List_of_ids.add(
              {'userid': data['first_userId'], 'chatid': data['id']});
        }
      }
      print('friend_userId count:${List_of_ids.length}');
      if (SecondFriendResponse.isNotEmpty) {
        for (final data in SecondFriendResponse) {
          List_of_ids.add(
              {'userid': data['second_userId'], 'chatid': data['id']});
        }
      }

      print('userId count:${List_of_ids.length}');

      if (List_of_ids.isNotEmpty) {
        for (final Data in List_of_ids) {
          final userData = (userResponse as List<dynamic>).firstWhere(
            (e) => e['id'] == Data['userid'],
          );
          FriendsModel data =
              FriendsModel.fromMap(userData, Data['chatid'], '');
          FriendsList.add(data);
        }

        print('GetfriendsList 👌✅');
        print({
          'friendsList': FriendsList.length,
        });
      }
      return FriendsList;
    } catch (e) {
      print('GetfriendsList Error: $e');
      return [];
    }
  }

  GetBlockedFriendsList() async {
    try {
      List<FriendsModel> FriendsList = [];
      List<Map<String, dynamic>> List_of_ids = [];

      // STEP 1:

      //Fetch the liked user IDs
      var FirstFriendResponse = await Supabase.instance.client
          .from('Conversation_table')
          .select('first_userId,id')
          .eq('second_userId', int.parse(LocalDataStorage.currentUserId.value))
          .eq('isblocked', 1);

      var SecondFriendResponse = await Supabase.instance.client
          .from('Conversation_table')
          .select('second_userId,id')
          .eq('first_userId', int.parse(LocalDataStorage.currentUserId.value))
          .eq('isblocked', 1);

      //Fetch All users
      var userResponse = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)');

      if (FirstFriendResponse.isNotEmpty) {
        for (final data in FirstFriendResponse) {
          List_of_ids.add(
              {'userid': data['first_userId'], 'chatid': data['id']});
        }
      }
      print('friend_userId count:${List_of_ids.length}');
      if (SecondFriendResponse.isNotEmpty) {
        for (final data in SecondFriendResponse) {
          List_of_ids.add(
              {'userid': data['second_userId'], 'chatid': data['id']});
        }
      }

      print('userId count:${List_of_ids.length}');

      if (List_of_ids.isNotEmpty) {
        for (final Data in List_of_ids) {
          final userData = (userResponse as List<dynamic>).firstWhere(
            (e) => e['id'] == Data['userid'],
          );
          FriendsModel data =
              FriendsModel.fromMap(userData, Data['chatid'], '');
          FriendsList.add(data);
        }

        print('GetBlockedFriendsList 👌✅');
        print({
          'friendsList': FriendsList.length,
        });
      }
      return FriendsList;
    } catch (e) {
      print('GetBlockedFriendsList Error: $e');
      return [];
    }
  }

  GetconversationList() async {
    try {
      List<FriendsModel> ConversationList = [];
      List<Map<String, dynamic>> List_of_ids = [];

      // STEP 1:

      //Fetch the liked user IDs
      var FirstFriendResponse = await Supabase.instance.client
          .from('Conversation_table')
          .select('first_userId,id,last_message')
          .eq('isblocked', 0)
          .eq('second_userId', int.parse(LocalDataStorage.currentUserId.value));

      var SecondFriendResponse = await Supabase.instance.client
          .from('Conversation_table')
          .select('second_userId,id,last_message')
          .eq('isblocked', 0)
          .eq('first_userId', int.parse(LocalDataStorage.currentUserId.value));

      //Fetch All users
      var userResponse = await Supabase.instance.client
          .from('users_table')
          .select('*,profilepicture_table(*)');

      if (FirstFriendResponse.isNotEmpty) {
        for (final data in FirstFriendResponse) {
          List_of_ids.add({
            'userid': data['first_userId'],
            'chatid': data['id'],
            'last_message': data['last_message']
          });
        }
      }

      print('friend_userId count:${List_of_ids.length}');

      if (SecondFriendResponse.isNotEmpty) {
        for (final data in SecondFriendResponse) {
          List_of_ids.add({
            'userid': data['second_userId'],
            'chatid': data['id'],
            'last_message': data['last_message']
          });
        }
      }

      print('userId count:${List_of_ids.length}');

      if (List_of_ids.isNotEmpty) {
        for (final Data in List_of_ids) {
          final userData = (userResponse as List<dynamic>).firstWhere(
            (e) => e['id'] == Data['userid'],
          );
          FriendsModel data = FriendsModel.fromMap(
              userData, Data['chatid'], Data['last_message']);
          ConversationList.add(data);
        }

        print('GetconversationList 👌✅');
        print({
          'ConversationList': ConversationList.length,
        });
      }
      return ConversationList;
    } catch (e) {
      print('GetconversationList Error: $e');
      return [];
    }
  }
}
