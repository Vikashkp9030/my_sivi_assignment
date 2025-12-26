import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sivi_assignment/features/chat_history/presentation/bloc/chat_history_bloc.dart';
import 'package:my_sivi_assignment/features/chat_history/presentation/bloc/chat_history_event.dart';

import '../core/di/service_locator.dart';
import '../core/router/app_router.dart';
// blocs
import '../features/chat/presentation/bloc/chat_bloc.dart';
import '../features/chat/presentation/bloc/chat_event.dart';
import '../features/users/presentation/bloc/users_bloc.dart';
import '../features/users/presentation/bloc/users_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (_) => sl<ChatBloc>()..add(LoadMessages()),
        ),

        BlocProvider<ChatHistoryBloc>(
          create: (_) => sl<ChatHistoryBloc>()..add(LoadChatHistory()),
        ),

        BlocProvider<UsersBloc>(
          create: (_) => sl<UsersBloc>()..add(LoadUsers()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'MySivi Chat',
        theme: ThemeData(useMaterial3: true),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
