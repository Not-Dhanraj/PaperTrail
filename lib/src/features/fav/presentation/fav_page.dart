import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/widgets/sliver_appbar.dart';
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
          SliverAppBarWidget(
            title: 'Bookmarks',
            punch: 'Your saved subjects',
            tintColor: Theme.of(context).scaffoldBackgroundColor,
            expHeight: 200,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (subject.quizItms > 0)
                              MoonButton(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 35,
                                backgroundColor: Theme.of(context)
                                    .dividerColor
                                    .withValues(alpha: 0.5),
                                onTap: () {
                                  // Handle quiz action
                                },
                                label: Text("Quiz"),
                              ),
                            SizedBox(
                              width: 5,
                            ),
                            if (subject.mtItm > 0)
                              MoonButton(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 35,
                                backgroundColor: Theme.of(context)
                                    .dividerColor
                                    .withValues(alpha: 0.5),
                                onTap: () {
                                  // Handle midterm action
                                },
                                label: Text("Midterm"),
                              ),
                            SizedBox(
                              width: 5,
                            ),
                            if (subject.etItm > 0)
                              MoonButton(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 35,
                                backgroundColor: Theme.of(context)
                                    .dividerColor
                                    .withValues(alpha: 0.5),
                                onTap: () {
                                  // Handle endterm action
                                },
                                label: Text("Endterm"),
                              ),
                            SizedBox(
                              width: 5,
                            ),
                            if (subject.ntItm > 0)
                              MoonButton(
                                padding: EdgeInsets.symmetric(horizontal: 8),
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
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
