import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/presentation/item_page.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class MidTermsPage extends ConsumerWidget {
  const MidTermsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredSubjects = ref.watch(filteredSubjectsProvider("mid"));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 0, left: 8, right: 8),
          child: MoonTextInput(
            hintText: "Search in MidTerms",
            onChanged: (String value) =>
                ref.read(filteredSubjectsProvider("mid").notifier).filter(
                      value,
                    ),
            leading: const Icon(MoonIcons.generic_search_24_light),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredSubjects.length,
            itemBuilder: (context, index) {
              final subject = filteredSubjects.elementAt(index);
              return ListTile(
                leading: MoonAvatar(
                  backgroundColor: Theme.of(context).dividerColor,
                  content: Icon(MoonIcons.files_add_24_regular),
                ),
                title: Text(
                  subject.subName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Subject Code: ${subject.subCode.join(", ")}"),
                trailing: MoonButton(
                  height: 35,
                  backgroundColor:
                      Theme.of(context).dividerColor.withAlpha(128),
                  label: Text('View'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ItemPage(
                          type: "Mid Term",
                          subId: subject.id,
                          subCode: subject.subCode,
                        );
                      },
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
