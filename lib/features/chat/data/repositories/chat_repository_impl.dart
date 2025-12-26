import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remote;
  ChatRepositoryImpl(this.remote);

  @override
  Future<List<Message>> fetchReceiverMessages() async {
    final data = await remote.fetchMessages();
    return data
        .map(
          (e) =>
              Message(text: e.body, isSender: false, dateTime: DateTime.now()),
        )
        .toList();
  }

  @override
  Future<List<Message>> getSenderMessages() async {
    return await remote.getSenderMsg();
  }

  @override
  Future<void> sendMessage(Message message) async {
    await remote.sendMessage(message);
  }
}
