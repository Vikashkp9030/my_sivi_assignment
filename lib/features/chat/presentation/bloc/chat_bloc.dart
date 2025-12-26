import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/message.dart';
import '../../domain/usecases/add_sender_msg.dart';
import '../../domain/usecases/fetch_receiver_message_usecase.dart';
import '../../domain/usecases/get_sender_msg.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchReceiverMessageUseCase fetchReceiverMessages;
  final GetSenderUseCase getSenderMessages;
  final AddSenderUserCase addSenderMessage;

  ChatBloc({
    required this.fetchReceiverMessages,
    required this.getSenderMessages,
    required this.addSenderMessage,
  }) : super(ChatLoading()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
  }

  /// 🔹 Load all messages
  Future<void> _onLoadMessages(
    LoadMessages event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading());

    final List<Message> data = [];
    bool hasError = false;

    try {
      data.addAll(await fetchReceiverMessages.call());
    } catch (_) {
      hasError = true;
    }

    try {
      data.addAll(await getSenderMessages.call());
    } catch (_) {
      hasError = true;
    }

    if (data.isEmpty && hasError) {
      emit(const ChatError('Failed to load messages'));
    } else {
      emit(ChatLoaded(data));
    }
  }

  /// 🔹 Send a message
  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    if (state is! ChatLoaded) return;

    final currentMessages = (state as ChatLoaded).messages;

    final newMessage = Message(
      text: event.text,
      isSender: true,
      userId: event.userId,
      dateTime: DateTime.now(),
      name: event.name,
    );

    try {
      addSenderMessage.call(newMessage);
      emit(ChatLoaded([...currentMessages, newMessage]));
    } catch (_) {
      emit(const ChatError('Failed to send message'));
    }
  }
}
