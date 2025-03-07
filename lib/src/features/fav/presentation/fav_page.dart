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
    var top = 0.0;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: EdgeInsets.only(top: 30, left: 15, bottom: 5),
          //     child: Text(
          //       "Bookmarks",
          //       style: Theme.of(context).textTheme.displaySmall?.copyWith(),
          //     ),
          //   ),
          // ),
          // SliverAppBar(
          //   expandedHeight: 200.0,
          //   floating: false,
          //   pinned: true,
          //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //   flexibleSpace: FlexibleSpaceBar(
          //     titlePadding: EdgeInsets.only(left: 16, bottom: 16),
          //     title: Column(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Bookmarks",
          //           style: TextStyle(
          //               fontSize: 24,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //         ),
          //         Text(
          //           "Your saved subjects",
          //           style: TextStyle(fontSize: 14, color: Colors.white70),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                        opacity: 1.0,
                        child: Text(
                          top.toString(),
                          style: TextStyle(fontSize: 12.0),
                        )),
                    background: Image.network(
                      "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                      fit: BoxFit.cover,
                    ));
              })),
          SliverList.builder(
            itemCount: favoriteSubjects.length,
            itemBuilder: (context, index) {
              final subject = favoriteSubjects[index];

              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(subject.subName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Code: ${subject.subCode.join(", ")}"),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (subject.quizItms > 0)
                            TextButton(
                              onPressed: () {
                                // Handle quiz action
                              },
                              child: Text("Quiz"),
                            ),
                          SizedBox(
                            height: 50,
                          ),
                          if (subject.mtItm > 0)
                            TextButton(
                              onPressed: () {
                                // Handle midterm action
                              },
                              child: Text("Midterm"),
                            ),
                          if (subject.etItm > 0)
                            TextButton(
                              onPressed: () {
                                // Handle endterm action
                              },
                              child: Text("Endterm"),
                            ),
                          if (subject.ntItm > 0)
                            TextButton(
                              onPressed: () {
                                // Handle notes action
                              },
                              child: Text("Notes"),
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
