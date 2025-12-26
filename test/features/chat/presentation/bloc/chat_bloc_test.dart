import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sivi_assignment/features/chat/domain/entities/message.dart';
import 'package:my_sivi_assignment/features/chat/domain/usecases/add_sender_msg.dart';
import 'package:my_sivi_assignment/features/chat/domain/usecases/fetch_receiver_message_usecase.dart';
import 'package:my_sivi_assignment/features/chat/domain/usecases/get_sender_msg.dart';
import 'package:my_sivi_assignment/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:my_sivi_assignment/features/chat/presentation/bloc/chat_event.dart';
import 'package:my_sivi_assignment/features/chat/presentation/bloc/chat_state.dart';

class MockFetchReceiver extends Mock implements FetchReceiverMessageUseCase {}

class MockGetSender extends Mock implements GetSenderUseCase {}

class MockAddSender extends Mock implements AddSenderUserCase {}

void main() {
  late ChatBloc bloc;

  late MockFetchReceiver fetchReceiver;
  late MockGetSender getSender;
  late MockAddSender addSender;

  final receiverMessages = [
    Message(text: 'Hi', isSender: false, dateTime: DateTime.now()),
  ];

  final senderMessages = [
    Message(text: 'Hello', isSender: true, dateTime: DateTime.now()),
  ];

  setUp(() {
    fetchReceiver = MockFetchReceiver();
    getSender = MockGetSender();
    addSender = MockAddSender();

    bloc = ChatBloc(
      fetchReceiverMessages: fetchReceiver,
      getSenderMessages: getSender,
      addSenderMessage: addSender,
    );
  });

  tearDown(() => bloc.close());

  blocTest<ChatBloc, ChatState>(
    'LoadMessages emits ChatLoaded',
    build: () {
      when(
        () => fetchReceiver.call(),
      ).thenAnswer((_) async => receiverMessages);
      when(() => getSender.call()).thenAnswer((_) async => senderMessages);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMessages()),
    expect: () => [isA<ChatLoading>(), isA<ChatLoaded>()],
  );

  blocTest<ChatBloc, ChatState>(
    'SendMessage adds message to current list',
    build: () {
      when(() => addSender.call(any())).thenReturn(() {} as Future<void>);
      return bloc;
    },
    seed: () => ChatLoaded(receiverMessages),
    act: (bloc) =>
        bloc.add(SendMessage(text: 'New msg', userId: '1', name: 'User')),
    expect: () => [isA<ChatLoaded>()],
  );
}
