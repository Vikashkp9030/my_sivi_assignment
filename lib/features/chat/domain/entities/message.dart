class Message {
  final String text;
  final bool isSender;
  final DateTime dateTime;
  final String? userId;
  final String? name;

  Message({
    required this.text,
    required this.isSender,
    required this.dateTime,
    this.userId,
    this.name,
  });
}
