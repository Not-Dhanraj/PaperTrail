import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/features/fav/services/fav_provider.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(subjectDataProvider);
    final favoriteIds = ref.watch(favoritesProvider);
    final favoriteSubjects =
        subjects.where((sub) => favoriteIds.contains(sub.id)).toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double percentage = (constraints.maxHeight - kToolbarHeight) /
                    (220 - kToolbarHeight);
                bool isCollapsed = percentage < 0.4; // Adjust threshold

                return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(
                    left: isCollapsed ? 56 : 16, // Shift right when collapsed
                    bottom: 16,
                  ),
                  title: isCollapsed
                      ? Text(
                          "Bookmarks",
                        )
                      : null, // Hide title when expanded
                  background: Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: AnimatedOpacity(
                        opacity: percentage.clamp(0.0, 1.0),
                        duration: Duration(milliseconds: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bookmarks",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text("Your saved subjects",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverList.builder(
            itemCount: favoriteSubjects.length,
            itemBuilder: (context, index) {
              final subject = favoriteSubjects[index];

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(subject.subName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Code: ${subject.subCode.join(", ")}")),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (subject.quizItms > 0)
                            MoonButton(
                              height: 35,
                              backgroundColor: Theme.of(context)
                                  .dividerColor
                                  .withValues(alpha: 0.5),
                              onTap: () {
                                // Handle quiz action
                              },
                              label: Text("Quiz"),
                            ),
                          if (subject.mtItm > 0)
                            MoonButton(
                              height: 35,
                              backgroundColor: Theme.of(context)
                                  .dividerColor
                                  .withValues(alpha: 0.5),
                              onTap: () {
                                // Handle midterm action
                              },
                              label: Text("Midterm"),
                            ),
                          if (subject.etItm > 0)
                            MoonButton(
                              height: 35,
                              backgroundColor: Theme.of(context)
                                  .dividerColor
                                  .withValues(alpha: 0.5),
                              onTap: () {
                                // Handle endterm action
                              },
                              label: Text("Endterm"),
                            ),
                          if (subject.ntItm > 0)
                            MoonButton(
                              height: 35,
                              backgroundColor: Theme.of(context)
                                  .dividerColor
                                  .withValues(alpha: 0.5),
                              onTap: () {
                                // Handle notes action
                              },
                              label: Text("Notes"),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(MoonIcons.arrows_left_24_regular),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
