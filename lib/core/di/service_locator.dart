import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:my_sivi_assignment/features/chat_history/data/datasources/chat_history_datasource.dart';
import 'package:my_sivi_assignment/features/chat_history/domain/repositories/chat_repository.dart';
import 'package:my_sivi_assignment/features/chat_history/domain/usecases/get_chat_history.dart';

import '../../features/chat/data/datasources/chat_remote_datasource.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../features/chat/domain/usecases/add_sender_msg.dart';
import '../../features/chat/domain/usecases/fetch_receiver_message_usecase.dart';
import '../../features/chat/domain/usecases/get_sender_msg.dart';
import '../../features/chat/presentation/bloc/chat_bloc.dart';
import '../../features/chat_history/data/repositories/chat_history_repository_impl.dart';
import '../../features/chat_history/presentation/bloc/chat_history_bloc.dart';
import '../../features/users/data/datasources/users_local_data_source.dart';
import '../../features/users/data/repositories/users_repository_impl.dart';
import '../../features/users/domain/repositories/users_repository.dart';
import '../../features/users/domain/usecases/add_user_usecase.dart';
import '../../features/users/domain/usecases/get_users_usecase.dart';
import '../../features/users/presentation/bloc/users_bloc.dart';
import '../hive/hive_boxes.dart';

final sl = GetIt.instance;

Future<void> setupDI() async {
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () =>
        ChatRemoteDataSourceImpl(chatBox: Hive.box<String>(HiveBoxes.chatBox)),
  );

  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));

  sl.registerLazySingleton(() => FetchReceiverMessageUseCase(sl()));
  sl.registerLazySingleton(() => AddSenderUserCase(sl()));
  sl.registerLazySingleton(() => GetSenderUseCase(sl()));

  sl.registerFactory(
    () => ChatBloc(
      fetchReceiverMessages: sl(),
      addSenderMessage: sl(),
      getSenderMessages: sl(),
    ),
  );

  sl.registerLazySingleton<Box<String>>(
    () => Hive.box<String>(HiveBoxes.usersBox),
  );

  sl.registerLazySingleton<UsersLocalDataSource>(
    () => UsersLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetUsersUseCase(sl()));
  sl.registerLazySingleton(() => AddUserUseCase(sl()));

  sl.registerFactory(() => UsersBloc(getUsers: sl(), addUser: sl()));

  sl.registerLazySingleton<ChatHistoryDataSourceImpl>(
    () =>
        ChatHistoryDataSourceImpl(chatBox: Hive.box<String>(HiveBoxes.chatBox)),
  );

  sl.registerLazySingleton<ChatHistoryRepo>(
    () => ChatHistoryRepositoryImpl(sl<ChatHistoryDataSourceImpl>()),
  );

  sl.registerLazySingleton<GetChatHistoryUsecase>(
    () => GetChatHistoryUsecase(sl<ChatHistoryRepo>()),
  );

  sl.registerFactory<ChatHistoryBloc>(
    () => ChatHistoryBloc(sl<GetChatHistoryUsecase>()),
  );
}
