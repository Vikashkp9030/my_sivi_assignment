import '../../domain/entities/message_history.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_history_datasource.dart';

class ChatHistoryRepositoryImpl implements ChatHistoryRepo {
  final ChatHistoryDataSourceImpl remote;
  ChatHistoryRepositoryImpl(this.remote);

  @override
  Future<List<MessageHistory>> getChatHistory() async {
    return await remote.getChatHistory();
  }
}
