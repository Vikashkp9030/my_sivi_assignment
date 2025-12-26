import 'package:go_router/go_router.dart';
import 'package:my_sivi_assignment/features/offers/presentation/offer_screen.dart';

import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/home/presentation/pages/bottom_shell_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/settings/presentation/setting_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BottomShellPage(child: child);
        },
        routes: [
          GoRoute(path: '/', builder: (_, __) => const HomePage()),
          GoRoute(path: '/offers', builder: (_, __) => const OfferScreen()),
          GoRoute(
            path: '/settings',
            builder: (_, __) => const SettingsScreen(),
          ),
          GoRoute(
            path: '/chat',
            builder: (context, state) {
              final data = state.extra as Map<String, String>;

              return ChatPage(name: data['name']!, userId: data['userId']!);
            },
          ),
        ],
      ),
    ],
  );
}
