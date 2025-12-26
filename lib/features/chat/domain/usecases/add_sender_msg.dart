import '../entities/message.dart';
import '../repositories/chat_repository.dart';

class AddSenderUserCase {
  final ChatRepository repo;
  AddSenderUserCase(this.repo);
  Future<void> call(Message message) => repo.sendMessage(message);
}
