import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:proj_app/src/features/exams/endterms/presentation/endt_page.dart';
import 'package:proj_app/src/features/exams/midterms/presentation/midt_page.dart';
import 'package:proj_app/src/features/exams/solutions/presentation/sol_page.dart';

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
    tabController = TabController(length: 3, vsync: this);
    super.initState();
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
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
            child: Text(
              "Midterm and End Term Questions",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
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
                Tab(text: 'Solutions'),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 5),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: ChoiceChip(
                      label: Text('data'),
                      selected: false,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: tabController,
            children: [
              MidTermsPage(),
              EndTermPage(),
              SolutionPage(),
            ],
          ),
        ),
      ],
    );
  }
}

///persistent tababr header.
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
