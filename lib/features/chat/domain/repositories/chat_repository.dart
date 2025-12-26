import '../entities/message.dart';

abstract class ChatRepository {
  Future<List<Message>> fetchReceiverMessages();
  Future<List<Message>> getSenderMessages();
  Future<void> sendMessage(Message message);
}
