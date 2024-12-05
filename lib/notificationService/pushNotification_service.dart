import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/services/localStorage.dart';

class PushnotificationService {
  static PushnotificationService? _instance;
  static PushnotificationService get getInstance =>
      _instance ??= PushnotificationService();

  getAccessToken() async {
    //------this will be downloaded from firebase cloud
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "soldiersfriends",
      "private_key_id": "05e8a52370de221ac4fdb330054a090051946568",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDdfw5VbBiUAKME\n/L+VwP38WsH91M0V4I4Kui1TW4bV5Ejg25vyGIynS5VhPFUmFhid6EnknimO6G+r\nc/wdulBjgSiZ8uwJN+HALFiUB0vZVR9LIBioMY9LzFF7dC6SB0dEudeD4dDWeqYW\nfc/y1L5z5UjpdkYRFwho0cNsPIBNy77Zv6yfGsAYw7eIuEBnaC/amqNmZUP1cxrm\nqAQYb0RnMIToSALeTXD3eIivMj6Aa2ydNDLhSg75jT1uqkGxoMvkxCq8VQ+TuR3a\nbD+SnQftyWsorXv0Ob+VDwE+m7NKBAiKtLGWErzCBb9aIOALzpGp6wCLs58gd+yB\nm3Cx2j1rAgMBAAECggEAMVGHnwSdKmND6Snf/NfGleiddkfqTFs+NWxECGICUWDt\ny0eK3yqRMvT083wsF3lnDM36mhGPflcJ+lquge4I1Uceg7zfyqOrPA+Dv54qSN+X\nwrIIW3cBiaaaZAs4DWLafxaEQsTGq+MOVUa5RUASkhq1E+q2ajq/MBu40EJebTOt\nD2TPAZTpvh8XUTJi4SQQ6z4ybRcgqvZMX31cKFaVgyNJX27ndn1EEiyZ4JtTMWvK\nW8UWakRed5YNGHK0spIiaJL2X80VAr09DSNDSAMVGHpIs6zLthgyiwiGuxlTXzqz\n5YIS33tgnxYbmXEbfDf3vf+cX5FNWqmuBwMLoegfcQKBgQD39Fjw5/wUq83dYnLy\nMkkz0x3KQru2sTpLKIb/mXfhmPA2JaA6rGZ1DTqdTYjnlbopf/j+SLKPZbuUfKlN\nwJGGt49PyHr6lWsfyvh0/K01CeU/PG4Nz8ciT9+TkFv46EkIHu7Ty0XSBpADtDlE\nxwwfRvcEQUKZi8s0bCglOzmzWwKBgQDkru6JkeB7W0Ma3svBdRxsEFhR9qU2z84x\n+tnTDjqogErglbjltF4TTRzXOrq8t0p9JW8GZgA1v1Wv9DD72UqeksjBL4aqx+YN\nYvYjoWUbe6+7S7xbl6Er9ovgdIoV7id4KuYB+WQV2q7QxO9jYzloiV3aQPTO4aml\nSqYmcG4LMQKBgB/n2D3/i+dZCB9xmJrjr5m0k8O//ImQmpCrQVvIcq2b0WUWSFzk\nbDapoh41qOUr1g2bAv4tepSLIa0EsYBoxBESs6UvheuSqHsp0fizvtHxWQdfDkZG\nszgOERXa4IrR0PvzhwXHxU82OvfPDAN2nW+04PoyL5C0dUxkknHgAhe7AoGBAJc3\nNXSyiYYIau8xs/pQvmKWzFAmkEkWUHqsLa1qE0+oxdqMJp9+DVcl/pQzuZdgfFkU\nj73jZPAlfTvEdT+UB8ujtCxKiPoVBQKFFc2pw3nQ5/spsXu/YEv507SwWz71JBRK\nCZ30k0IAQOi70LAfxK5jZzQTD85dWhh6rDNu1NWBAoGBAIFR+lLx13yXNHv5WA6l\nXhxzqN45Bhl9LHS6+oG6KqFLmUEuNdSa/rLcmdVIbSzyJRyVOpBx5geZz11FsgiI\nbgYuQV5mUQh+HMfcINr2zsoTvYWFe8UJLGc1iG3j14c6fms4uqBE3mjyqcQ00lQW\nIoZM/30fHdimBiPS7MAIuDtZ\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-pggya@soldiersfriends.iam.gserviceaccount.com",
      "client_id": "117261701113657404154",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-pggya%40soldiersfriends.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      'https://www.googleapis.com/auth/firebase.messaging'
    ];

    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    auth.AccessCredentials crendentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);

    client.close();
    print('Access Token 👌✅: ${crendentials.accessToken.data}');
    await LocalDataStorage.getInstance
        .setAccessToken(crendentials.accessToken.data);
    return crendentials.accessToken.data;
  }

  Future<bool> likeRequestNotification(
      String FcmToken, String Notificationtype) async {
    try {
      var data;
      if (Notificationtype == 'likeRequest') {
        data = {
          'message': {
            'token': LocalDataStorage.fcmToken.value,
            'notification': {
              "title": 'Friend Request',
              'body': '${LocalDataStorage.username.value} likes you',
            },
            'data': {'key': 'NewRequest'}
          }
        };
      }

      final ServiceKey = LocalDataStorage.accessToken.value;
      var project_id = 'soldiersfriends';

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/$project_id/messages:send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ServiceKey}',
        },
        body: jsonEncode(data),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print("likeRequestNotification 👌✅");
        return true;
      } else {
        print("Failed to send notification. Status Code: ${response}");
        return false;
      }
    } catch (e) {
      print('likeRequestNotification Error: $e');
      return false;
    }
  }

  Future<bool> AddFriendNotification(String FcmToken, int userId) async {
    try {
      var data = {
        'message': {
          'token': LocalDataStorage.fcmToken.value,
          'notification': {
            "title": 'New Friend Added',
            'body':
                '${LocalDataStorage.username.value} add you in his friend list',
          },
          'data': {
            'key': 'FriendList',
            'userId': userId.toString(),
          }
        }
      };

      final ServiceKey = LocalDataStorage.accessToken.value;
      var project_id = 'soldiersfriends';

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/$project_id/messages:send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ServiceKey}',
        },
        body: jsonEncode(data),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print("AddFriendNotification 👌✅");
        return true;
      } else {
        print("Failed to send notification. Status Code: ${response}");
        return false;
      }
    } catch (e) {
      print('AddFriendNotification Error: $e');
      return false;
    }
  }

  Future<bool> sendMessageNotification(
      String FcmToken, FriendsModel userData) async {
    try {
      var data = {
        'message': {
          'token': LocalDataStorage.fcmToken.value,
          'notification': {
            "title": 'Got New Message',
            'body': '${LocalDataStorage.username.value} sent you a message',
          },
          'data': {'key': 'newmessage', 'chatId': userData.chatId.toString()}
        }
      };

      final ServiceKey = LocalDataStorage.accessToken.value;
      var project_id = 'soldiersfriends';

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/$project_id/messages:send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ServiceKey}',
        },
        body: jsonEncode(data),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print("sendMessageNotification 👌✅");
        return true;
      } else {
        print("Failed to send notification. Status Code: ${response}");
        return false;
      }
    } catch (e) {
      print('sendMessageNotification Error: $e');
      return false;
    }
  }
}
