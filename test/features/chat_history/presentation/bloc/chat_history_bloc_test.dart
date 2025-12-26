import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sivi_assignment/features/chat/domain/entities/message.dart';
import 'package:my_sivi_assignment/features/chat_history/domain/entities/message_history.dart';
import 'package:my_sivi_assignment/features/chat_history/domain/usecases/get_chat_history.dart';
import 'package:my_sivi_assignment/features/chat_history/presentation/bloc/chat_history_bloc.dart';
import 'package:my_sivi_assignment/features/chat_history/presentation/bloc/chat_history_event.dart';
import 'package:my_sivi_assignment/features/chat_history/presentation/bloc/chat_history_state.dart';

class MockGetChatHistory extends Mock implements GetChatHistoryUsecase {}

void main() {
  late ChatHistoryBloc bloc;
  late MockGetChatHistory getChatHistory;

  final messages = [
    Message(text: 'Hi', isSender: false, dateTime: DateTime.now()),
  ];

  setUp(() {
    getChatHistory = MockGetChatHistory();
    bloc = ChatHistoryBloc(getChatHistory);
  });

  tearDown(() => bloc.close());

  blocTest<ChatHistoryBloc, ChatHistoryState>(
    'LoadChatHistory success',
    build: () {
      when(
        () => getChatHistory.call(),
      ).thenAnswer((_) async => messages.cast<MessageHistory>());
      return bloc;
    },
    act: (bloc) => bloc.add(LoadChatHistory()),
    expect: () => [
      ChatHistoryLoading(),
      ChatHistoryLoaded(messages.cast<MessageHistory>()),
    ],
  );
}
