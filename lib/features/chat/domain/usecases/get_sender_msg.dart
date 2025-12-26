import '../entities/message.dart';
import '../repositories/chat_repository.dart';

class GetSenderUseCase {
  final ChatRepository repo;
  GetSenderUseCase(this.repo);
  Future<List<Message>> call() => repo.getSenderMessages();
}
