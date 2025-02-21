import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/src/features/pageview/application/pgv_service.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pgViewService = ref.watch(pageViewService);
    return FlashyTabBar(
      // height: 55,
      shadows: [
        BoxShadow(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.7),
            blurRadius: 3)
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedIndex: pgViewService.currentindex,
      showElevation: true,
      onItemSelected: (index) {
        ref.watch(pageViewService.notifier).updateIndex(index);
      },
      items: [
        FlashyTabBarItem(
          icon: Icon(Icons.event),
          title: Text('Events'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.highlight),
          title: Text('Highlights'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}
