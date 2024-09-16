class ChatModel {
  final String name;
  final String lastMessage;
  final int messageCount;
  final bool isOnline;

  ChatModel({
    required this.name,
    required this.lastMessage,
    required this.messageCount,
    this.isOnline = false,
  });
}
