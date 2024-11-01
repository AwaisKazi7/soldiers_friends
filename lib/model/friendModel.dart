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
  });

  factory FriendsModel.fromMap(Map<String, dynamic> json, int chatid) {
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
        chatId: chatid);
  }

  // Method to convert FriendsModel to a map (e.g., for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'DOB': DOB,
      'bio': bio,
      'country': country,
      'isApprove': isApprove,
      'isDelete': isDelete,
      'createdAt': createdAt.toIso8601String(),
      'chat_id': chatId, // Include chat_id in the map
    };
  }
}
