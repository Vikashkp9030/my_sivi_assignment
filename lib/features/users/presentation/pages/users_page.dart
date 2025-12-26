import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';
import '../bloc/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  void _openAddUserDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Add New User',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter user name',
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isEmpty) return;

                context.read<UsersBloc>().add(AddUserEvent(name));

                Navigator.of(dialogContext).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (_, state) {
          // 🔄 Loading
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UsersError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          if (state is UsersLoaded) {
            if (state.users.isEmpty) {
              return const Center(
                child: Text(
                  'No users yet',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, i) {
                final user = state.users[i];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () => context.push(
                      '/chat',
                      extra: {'name': user.name, 'userId': user.userId},
                    ),
                    leading: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: AppColors.avatarPurple,
                          child: Text(
                            user.name[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        /// Online indicator
                        if (i % 2 == 0)
                          Positioned(
                            right: 2,
                            bottom: 2,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: AppColors.onlineGreen,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      (i % 2 == 0) ? 'Online' : '2 min ago',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddUserDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
