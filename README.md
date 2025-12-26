# my_sivi_assignment

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
lib/
│
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── app_initializer.dart
│
├── core/
│   ├── di/
│   │   └── service_locator.dart
│   │
│   ├── router/
│   │   └── app_router.dart
│   │
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── api_endpoints.dart
│   │   └── network_info.dart
│   │
│   ├── storage/
│   │   ├── hive_boxes.dart
│   │   └── local_storage.dart
│   │
│   ├── error/
│   │   ├── failure.dart
│   │   └── exceptions.dart
│   │
│   ├── utils/
│   │   ├── constants.dart
│   │   ├── date_utils.dart
│   │   └── extensions.dart
│   │
│   └── theme/
│       └── app_theme.dart
│
├── features/
│   ├── home/
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   │   ├── home_bloc.dart
│   │   │   │   ├── home_event.dart
│   │   │   │   └── home_state.dart
│   │   │   │
│   │   │   ├── pages/
│   │   │   │   └── home_page.dart
│   │   │   │
│   │   │   └── widgets/
│   │   │       ├── top_tab_switcher.dart
│   │   │       └── home_app_bar.dart
│   │   │
│   │   └── home_exports.dart
│
│   ├── users/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── user_model.dart
│   │   │   │
│   │   │   ├── datasources/
│   │   │   │   └── user_local_datasource.dart
│   │   │   │
│   │   │   └── repositories/
│   │   │       └── user_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user.dart
│   │   │   │
│   │   │   ├── repositories/
│   │   │   │   └── user_repository.dart
│   │   │   │
│   │   │   └── usecases/
│   │   │       ├── get_users_usecase.dart
│   │   │       └── add_user_usecase.dart
│   │   │
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── users_bloc.dart
│   │       │   ├── users_event.dart
│   │       │   └── users_state.dart
│   │       │
│   │       ├── pages/
│   │       │   └── users_page.dart
│   │       │
│   │       └── widgets/
│   │           ├── user_tile.dart
│   │           └── add_user_fab.dart
│
│   ├── chat/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── message_model.dart
│   │   │   │
│   │   │   ├── datasources/
│   │   │   │   ├── chat_remote_datasource.dart
│   │   │   │   └── chat_local_datasource.dart
│   │   │   │
│   │   │   └── repositories/
│   │   │       └── chat_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── message.dart
│   │   │   │
│   │   │   ├── repositories/
│   │   │   │   └── chat_repository.dart
│   │   │   │
│   │   │   └── usecases/
│   │   │       ├── send_message_usecase.dart
│   │   │       └── fetch_receiver_message_usecase.dart
│   │   │
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── chat_bloc.dart
│   │       │   ├── chat_event.dart
│   │       │   └── chat_state.dart
│   │       │
│   │       ├── pages/
│   │       │   └── chat_page.dart
│   │       │
│   │       └── widgets/
│   │           ├── message_bubble.dart
│   │           ├── message_input.dart
│   │           └── chat_app_bar.dart
│
│   ├── chat_history/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── chat_history_model.dart
│   │   │   │
│   │   │   ├── datasources/
│   │   │   │   └── chat_history_local_datasource.dart
│   │   │   │
│   │   │   └── repositories/
│   │   │       └── chat_history_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── chat_history.dart
│   │   │   │
│   │   │   ├── repositories/
│   │   │   │   └── chat_history_repository.dart
│   │   │   │
│   │   │   └── usecases/
│   │   │       ├── get_chat_history_usecase.dart
│   │   │       └── save_chat_history_usecase.dart
│   │   │
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── chat_history_bloc.dart
│   │       │   ├── chat_history_event.dart
│   │       │   └── chat_history_state.dart
│   │       │
│   │       ├── pages/
│   │       │   └── chat_history_page.dart
│   │       │
│   │       └── widgets/
│   │           └── chat_history_tile.dart
│
├── shared/
│   ├── widgets/
│   │   ├── avatar_widget.dart
│   │   ├── empty_state_widget.dart
│   │   └── loading_widget.dart
│   │
│   └── styles/
│       └── text_styles.dart
│
└── test/
├── core/
├── features/
│   ├── users/
│   ├── chat/
│   └── chat_history/
└── mocks/
