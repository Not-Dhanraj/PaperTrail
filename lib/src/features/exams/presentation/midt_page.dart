import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/presentation/item_page.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class MidTermsPage extends ConsumerWidget {
  const MidTermsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var initData = ref.watch(subjectDataProvider);
    var query = ref.watch(searchQueryProvider).toLowerCase();
    var subData = initData.where((obj) => obj.mtItm != 0);

    var filteredData = subData.where((subject) =>
        subject.subName.toLowerCase().contains(query) ||
        subject.subCode.any((code) => code.toLowerCase().contains(query)));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 0, left: 8, right: 8),
          child: MoonTextInput(
            hintText: "Search in MidTerms",
            onChanged: (String value) =>
                ref.read(searchQueryProvider.notifier).state = value,
            leading: const Icon(MoonIcons.generic_search_24_light),
            trailing: MoonButton.icon(
              buttonSize: MoonButtonSize.xs,
              hoverEffectColor: Colors.transparent,
              icon: const Icon(MoonIcons.controls_close_16_light),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              final subject = filteredData.elementAt(index);
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
