class MessageModel {
  final int id;
  final int senderId;
  final int receiverId;
  final String content;
  final int mediaType;
  final String? imageUrl;
  final DateTime? updatedAt;
  final DateTime createdAt;
  final int? chatId;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.mediaType,
    this.imageUrl,
    this.updatedAt,
    required this.createdAt,
    this.chatId,
  });

  // Factory method to create a Message object from JSON
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['reciver_id'],
      content: json['content'],
      mediaType: json['media_type'],
      imageUrl: json['image_url'],
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      chatId: json['chat_id'],
    );
  }

  // Method to convert a Message object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'reciver_id': receiverId,
      'content': content,
      'media_type': mediaType,
      'image_url': imageUrl,
      'updated_at': updatedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'chat_id': chatId,
    };
  }
}
