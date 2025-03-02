import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/presentation/Item_page.dart';

class EndTermPage extends ConsumerWidget {
  const EndTermPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var initData = ref.watch(subjectDataProvider);
    var subData = initData.where((obj) => obj.etItm != 0);
    return ListView.builder(
      itemCount: subData.length,
      itemBuilder: (context, index) {
        return ListTile(
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
          subtitle: Text("Subject Code: ${subData.elementAt(index).subCode}"),
          trailing: MoonButton(
            height: 35,
            backgroundColor:
                Theme.of(context).dividerColor.withValues(alpha: 0.5),
            label: Text('View'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ItemPage(
                      type: "End Term",
                      subCode: subData.elementAt(index).subCode);
                },
              ));
            },
          ),
        );
      },
    );
  }
}
