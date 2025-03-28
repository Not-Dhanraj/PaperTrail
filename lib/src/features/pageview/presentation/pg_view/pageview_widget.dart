import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/features/pageview/application/pgv_service.dart';
import 'package:papertrail/src/features/pageview/presentation/pg_view/pgv_pages.dart';

class PageviewWidget extends ConsumerWidget {
  const PageviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pgService = ref.watch(pageViewService);
    return PageView.builder(
      itemCount: 3,
      controller: pgService.pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Entry.scale(
            scale: .96,
            duration: Duration(milliseconds: 300),
            child: Entry.opacity(
                duration: Duration(milliseconds: 600),
                child: PageviewPages(index: index)));
      },
    );
  }
}
