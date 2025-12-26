import 'package:equatable/equatable.dart';

class MessageHistory extends Equatable {
  final String text;
  final bool isSender;
  final DateTime dateTime;
  final String? userId;
  final String? name;

  const MessageHistory({
    required this.text,
    required this.isSender,
    required this.dateTime,
    this.userId,
    this.name,
  });

  factory MessageHistory.fromJson(Map<String, dynamic> json) {
    return MessageHistory(
      text: json['text'] as String,
      isSender: json['isSender'] as bool,
      dateTime: DateTime.parse(json['dateTime'] as String),
      userId: json['userId'] as String?,
      name: json['name'] as String?,
    );
  }

  @override
  List<Object?> get props => [userId, name];
}
