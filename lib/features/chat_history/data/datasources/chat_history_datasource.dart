import 'dart:convert';

import 'package:hive/hive.dart';

import '../../domain/entities/message_history.dart';

abstract class ChatHistoryDataSource {
  Future<List<MessageHistory>> getChatHistory();
}

class ChatHistoryDataSourceImpl implements ChatHistoryDataSource {
  final Box<String> chatBox;

  ChatHistoryDataSourceImpl({required this.chatBox});

  @override
  Future<List<MessageHistory>> getChatHistory() async {
    final data = await chatBox.values
        .map((e) => MessageHistory.fromJson(jsonDecode(e)))
        .toList();
    data.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return data.toSet().toList();
  }
}
