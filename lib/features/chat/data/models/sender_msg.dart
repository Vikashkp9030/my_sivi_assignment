import '../../domain/entities/message.dart';

class SenderMsg extends Message {
  SenderMsg({
    required super.text,
    required super.isSender,
    required super.dateTime,
    required super.userId,
    required super.name,
  });

  factory SenderMsg.fromJson(Map<String, dynamic> json) {
    return SenderMsg(
      text: json['text'],
      isSender: json['isSender'],
      dateTime: DateTime.parse(json['dateTime']),
      userId: json['userId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isSender': isSender,
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'name': name,
    };
  }

  factory SenderMsg.fromEntity(Message entity) {
    return SenderMsg(
      text: entity.text,
      isSender: entity.isSender,
      dateTime: entity.dateTime,
      userId: entity.userId,
      name: entity.name,
    );
  }

  Message toEntity() {
    return Message(
      text: text,
      isSender: isSender,
      dateTime: dateTime,
      userId: userId,
      name: name,
    );
  }
}
