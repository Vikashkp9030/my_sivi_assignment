import '../entities/message_history.dart';

abstract class ChatHistoryRepo {
  Future<List<MessageHistory>> getChatHistory();
}
