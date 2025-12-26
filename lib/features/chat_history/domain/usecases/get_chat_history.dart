import 'package:my_sivi_assignment/features/chat_history/domain/repositories/chat_repository.dart';

import '../entities/message_history.dart';

class GetChatHistoryUsecase {
  final ChatHistoryRepo repo;
  GetChatHistoryUsecase(this.repo);
  Future<List<MessageHistory>> call() => repo.getChatHistory();
}
