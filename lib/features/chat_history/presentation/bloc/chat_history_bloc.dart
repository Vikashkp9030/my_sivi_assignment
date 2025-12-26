import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_chat_history.dart';
import 'chat_history_event.dart';
import 'chat_history_state.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  final GetChatHistoryUsecase getChatHistoryUsecase;

  ChatHistoryBloc(this.getChatHistoryUsecase) : super(ChatHistoryLoading()) {
    on<LoadChatHistory>(_onLoadChatHistory);
  }

  Future<void> _onLoadChatHistory(
    LoadChatHistory event,
    Emitter<ChatHistoryState> emit,
  ) async {
    try {
      emit(ChatHistoryLoading());

      final messages = await getChatHistoryUsecase.call();

      emit(ChatHistoryLoaded(messages));
    } catch (e) {
      emit(ChatHistoryError('Failed to load chat history'));
    }
  }
}
