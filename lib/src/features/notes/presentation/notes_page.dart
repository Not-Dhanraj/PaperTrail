import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/presentation/item_page.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var initData = ref.watch(subjectDataProvider);
    var subData = initData.where((obj) => obj.ntItm != 0);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 15, bottom: 5),
            child: Text(
              "Notes",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Subjects",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: subData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: ListTile(
                  leading: MoonAvatar(
                    backgroundColor: Theme.of(context).dividerColor,
                    content: Icon(MoonIcons.files_add_24_regular),
                  ),
                  title: Text(
                    subData.elementAt(index).subName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      "Subject code: ${subData.elementAt(index).subCode.join(", ")}",
                      style: const TextStyle(color: Colors.grey)),
                  trailing: MoonButton(
                    height: 35,
                    backgroundColor:
                        Theme.of(context).dividerColor.withValues(alpha: 0.5),
                    label: Text('View'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ItemPage(
                              type: "Notes",
                              subId: subData.elementAt(index).id,
                              subCode: subData.elementAt(index).subCode);
                        },
                      ));
                    },
                  ),
                  // onTap: () {},
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
