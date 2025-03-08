import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';
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
  late Iterable<SubjectItems> midItems;
  late Iterable<SubjectItems> endItems;
  late Iterable<SubjectItems> quizItems;
  @override
  void initState() {
    var initData = ref.read(subjectDataProvider);
    midItems = initData.where((obj) => obj.mtItm != 0);
    endItems = initData.where((obj) => obj.etItm != 0);
    quizItems = initData.where((obj) => obj.quizItms != 0);
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        ref.invalidate(searchQueryProvider); // Reset search when tab changes
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBarWidget(
              title: 'PYQ\'s',
              punch: 'Get Previous year question papers',
              expHeight: 264,
              tintColor: Theme.of(context).primaryColor,
              paddreq: false,
              bpadding: 49,
              bTpadding: 67,
              bottomwid: _ColoredTabBar(
                bgcolor: Theme.of(context).scaffoldBackgroundColor,
                tabBar: TabBar(
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
              ),
            )
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            MidTermsPage(
              subData: midItems,
            ),
            EndTermPage(
              subData: endItems,
            ),
            QuizPage(
              subData: quizItems,
            ),
          ],
        ),
      ),
    );
  }
}

class _ColoredTabBar extends Container implements PreferredSizeWidget {
  _ColoredTabBar({required this.bgcolor, required this.tabBar});

  final Color bgcolor;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        height: kToolbarHeight - 5,
        color: bgcolor,
        child: tabBar,
      );
}
