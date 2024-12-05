//made by salman lodhi
class FriendsModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phonenumber;
  final String DOB;
  final String bio;
  final String country;
  final int isApprove;
  final int isDelete;
  final DateTime createdAt;
  final List<String> images;
  final int chatId;
  final int isblocked;
  final String lastMessage;

  FriendsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phonenumber,
    required this.DOB,
    required this.bio,
    required this.country,
    required this.isApprove,
    required this.isDelete,
    required this.createdAt,
    required this.images,
    required this.chatId,
    required this.isblocked,
    required this.lastMessage,
  });

  factory FriendsModel.fromMap(Map<String, dynamic> json, int chatid,
      String lastMessage, int isblocked) {
    return FriendsModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phonenumber: json['phonenumber'] ?? '',
      DOB: json['DOB'] ?? '',
      bio: json['bio'] ?? '',
      country: json['country'] ?? '',
      isApprove: json['isApprove'],
      isDelete: json['isDelete'],
      createdAt: DateTime.parse(json['created_at']),
      images: List<String>.from(
          json['profilepicture_table'].map((e) => e['imageUrl'])),
      chatId: chatid,
      isblocked: isblocked,
      lastMessage: lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "phonenumber": phonenumber,
      "DOB": DOB,
      "bio": bio,
      "country": country,
      "isApprove": isApprove,
      "isDelete": isDelete,
      "createdAt": createdAt.toIso8601String(),
      "chat_id": chatId,
      "images": images,
      "isblocked": isblocked,
      "lastMessage": lastMessage,
    };
  }
}
