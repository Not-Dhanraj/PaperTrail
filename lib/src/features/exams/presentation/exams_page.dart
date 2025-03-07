import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/widgets/sliver_appbar.dart';
import 'package:papertrail/src/features/exams/Quiz/presentation/quiz_page.dart';
import 'package:papertrail/src/features/exams/presentation/endt_page.dart';
import 'package:papertrail/src/features/exams/presentation/midt_page.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class ExamsPage extends ConsumerStatefulWidget {
  const ExamsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExamsPageState();
}

class _ExamsPageState extends ConsumerState<ExamsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        ref.invalidate(searchQueryProvider); // Reset search when tab changes
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBarWidget(
          title: 'PYQ\'s',
          punch: 'Get Previous year question papers',
          expHeight: 170,
          tintColor: Theme.of(context).primaryColor,
          paddreq: false,
          bpadding: 8,
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
              TabBar(
                splashBorderRadius: BorderRadius.circular(6),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                controller: tabController,
                tabs: [
                  Tab(text: 'Midterms'),
                  Tab(text: 'End Terms'),
                  Tab(text: 'Quizzes'),
                ],
              ),
              Theme.of(context).scaffoldBackgroundColor),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: tabController,
            children: [
              MidTermsPage(),
              EndTermPage(),
              QuizPage(),
            ],
          ),
        ),
      ],
    );
  }
}

/// Persistent TabBar header with a red background.
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  _SliverAppBarDelegate(this.tabBar, this.color);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color, // Red background color for the TabBar
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
