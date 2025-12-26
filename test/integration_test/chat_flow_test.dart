import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_sivi_assignment/app/app.dart';
import 'package:my_sivi_assignment/core/di/service_locator.dart';
import 'package:my_sivi_assignment/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:my_sivi_assignment/features/chat/presentation/bloc/chat_event.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Load messages and send message', (tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => sl<ChatBloc>()..add(LoadMessages()),
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('hello'), findsWidgets);

    await tester.enterText(
      find.byKey(const Key('message_input')),
      'Integration test message',
    );

    await tester.tap(find.byKey(const Key('send_button')));
    await tester.pumpAndSettle();

    expect(find.text('Integration test message'), findsOneWidget);
  });
}
