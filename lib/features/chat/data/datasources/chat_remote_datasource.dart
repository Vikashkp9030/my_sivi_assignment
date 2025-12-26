import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:my_sivi_assignment/features/chat/data/models/sender_msg.dart';
import 'package:my_sivi_assignment/features/chat/domain/entities/message.dart';

import '../../../../core/network/api_service.dart';
import '../models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<MessageModel>> fetchMessages();
  Future<void> sendMessage(Message message);
  Future<List<Message>> getSenderMsg();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final Box<String> chatBox;

  ChatRemoteDataSourceImpl({required this.chatBox});

  @override
  Future<List<MessageModel>> fetchMessages() async {
    final res = await ApiService().get(
      '/comments',
      queryParameters: {'limit': '10'},
    );

    final List comments = res.data['comments'];

    return comments.map((e) => MessageModel.fromJson(e)).toList();
  }

  @override
  Future<List<Message>> getSenderMsg() async {
    return await chatBox.values
        .map((e) => SenderMsg.fromJson(jsonDecode(e)))
        .toList();
  }

  @override
  Future<void> sendMessage(Message message) async {
    final res = await chatBox.values
        .map((e) => SenderMsg.fromJson(jsonDecode(e)))
        .toList();
    res.add(SenderMsg.fromEntity(message));
    await chatBox.add(jsonEncode(res.last.toJson()));
  }
}
