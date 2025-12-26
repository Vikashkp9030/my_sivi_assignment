import '../repositories/chat_repository.dart';
import '../entities/message.dart';

class FetchReceiverMessageUseCase {
  final ChatRepository repo;
  FetchReceiverMessageUseCase(this.repo);
  Future<List<Message>> call() => repo.fetchReceiverMessages();
}