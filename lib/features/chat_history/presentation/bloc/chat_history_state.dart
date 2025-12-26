import '../../domain/entities/message_history.dart';

abstract class ChatHistoryState {}

class ChatHistoryLoading extends ChatHistoryState {}

class ChatHistoryLoaded extends ChatHistoryState {
  final List<MessageHistory> messages;

  ChatHistoryLoaded(this.messages);
}

class ChatHistoryError extends ChatHistoryState {
  final String message;

  ChatHistoryError(this.message);
}
