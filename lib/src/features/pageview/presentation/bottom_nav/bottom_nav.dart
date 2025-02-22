import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:proj_app/src/features/pageview/application/pgv_service.dart';
import 'package:sprung/sprung.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pgViewService = ref.watch(pageViewService);
    var unselected = Theme.of(context)
        .bottomNavigationBarTheme
        .unselectedIconTheme
        ?.color
        ?.withValues(alpha: 0.7);
    var selected =
        Theme.of(context).colorScheme.onSurface.withValues(alpha: .85);

    return FlashyTabBar(
      iconSize: 23,
      shadows: [
        BoxShadow(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.7),
            blurRadius: 3)
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedIndex: pgViewService.currentindex,
      showElevation: true,
      animationCurve: Sprung.underDamped,
      animationDuration: Duration(milliseconds: 250),
      onItemSelected: (index) {
        ref.watch(pageViewService.notifier).updateIndex(index);
      },
      items: [
        FlashyTabBarItem(
          activeColor: selected,
          inactiveColor: unselected!,
          icon: Icon(
            MoonIcons.generic_home_24_regular,
          ),
          title: Text(
            'Home',
          ),
        ),
        FlashyTabBarItem(
          activeColor: selected,
          inactiveColor: unselected,
          icon: Icon(
            MoonIcons.files_text_24_regular,
          ),
          title: Text(
            'Notes',
          ),
        ),
        FlashyTabBarItem(
          activeColor: selected,
          inactiveColor: unselected,
          icon: Icon(
            MoonIcons.files_add_24_regular,
          ),
          title: Text(
            'Exams',
          ),
        ),
        FlashyTabBarItem(
          activeColor: selected,
          inactiveColor: unselected,
          icon: Icon(
            MoonIcons.notifications_settings_24_regular,
          ),
          title: Text(
            'Settings',
          ),
        ),
      ],
    );
  }
}
