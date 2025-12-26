import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/chat_history_bloc.dart';
import '../bloc/chat_history_event.dart';
import '../bloc/chat_history_state.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatHistoryBloc>()..add(LoadChatHistory()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Chats')),
        body: BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
          builder: (context, state) {
            if (state is ChatHistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ChatHistoryLoaded) {
              return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (_, index) {
                  final msg = state.messages[index];

                  return ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.onlineGreen,
                      child: Text(
                        (msg.name ?? 'U')[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    title: Text(msg.name ?? 'Unknown'),
                    subtitle: Text(
                      msg.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      DateFormat('hh:mm a').format(msg.dateTime),
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                },
              );
            }

            if (state is ChatHistoryError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
