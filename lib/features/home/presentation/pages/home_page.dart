import 'package:flutter/material.dart';

import '../../../chat_history/presentation/pages/chat_history_page.dart';
import '../../../users/presentation/pages/users_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: _AppBarSwitcher(controller: _tabController),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [UsersPage(), ChatHistoryPage()],
        ),
      ),
    );
  }
}

class _AppBarSwitcher extends StatelessWidget {
  final TabController controller;

  const _AppBarSwitcher({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SwitchItem(
                title: 'Users',
                selected: controller.index == 0,
                onTap: () => controller.animateTo(0),
              ),
              _SwitchItem(
                title: 'Chat History',
                selected: controller.index == 1,
                onTap: () => controller.animateTo(1),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _SwitchItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4,
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
