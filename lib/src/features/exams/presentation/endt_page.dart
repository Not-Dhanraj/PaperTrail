import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/widgets/list_widget.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class EndTermPage extends ConsumerWidget {
  const EndTermPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var initData = ref.watch(subjectDataProvider);
    var query = ref.watch(searchQueryProvider).toLowerCase();
    var subData = initData.where((obj) => obj.etItm != 0);

    var filteredData = subData.where((subject) =>
        subject.subName.toLowerCase().contains(query) ||
        subject.subCode.any((code) => code.toLowerCase().contains(query)));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 5, left: 8, right: 8),
          child: MoonTextInput(
            hintText: "Search in EndTerms",
            onChanged: (String value) =>
                ref.read(searchQueryProvider.notifier).state = value,
            leading: const Icon(MoonIcons.generic_search_24_light),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              final subject = filteredData.elementAt(index);
              return ListWidget(
                sub: subject,
                type: "End Term",
              );
            },
          ),
        ),
      ],
    );
  }
}
