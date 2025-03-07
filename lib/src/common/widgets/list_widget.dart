import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';
import 'package:papertrail/src/common/presentation/item_page.dart';

class ListWidget extends StatelessWidget {
  final SubjectItems sub;
  final String type;
  const ListWidget({super.key, required this.sub, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: ListTile(
          leading: MoonAvatar(
            backgroundColor: Theme.of(context).dividerColor,
            content: Icon(MoonIcons.files_add_24_regular),
          ),
          title: Text(
            sub.subName,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Subject code: ${sub.subCode.join(", ")}",
              style: const TextStyle(color: Colors.grey)),
          trailing: MoonButton(
            height: 35,
            backgroundColor:
                Theme.of(context).dividerColor.withValues(alpha: 0.5),
            label: Text('View'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ItemPage(
                        type: type, subId: sub.id, subCode: sub.subCode);
                  },
                ),
              );
            },
          ),
          // onTap: () {},
        ),
      ),
    );
  }
}
