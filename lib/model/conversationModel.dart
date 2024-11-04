//made by salman lodhi
class ConversationModel {
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
  final String lastMessage;

  ConversationModel({
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
    required this.lastMessage,
  });

  factory ConversationModel.fromMap(
      Map<String, dynamic> json, int chatid, String lastMessage) {
    return ConversationModel(
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
      lastMessage: lastMessage,
    );
  }
}
