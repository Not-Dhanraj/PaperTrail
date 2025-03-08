import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';
import 'package:papertrail/src/common/widgets/list_widget.dart';
import 'package:papertrail/src/common/widgets/sliver_appbar.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class NotesPage extends ConsumerStatefulWidget {
  const NotesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesPageState();
}

class _NotesPageState extends ConsumerState<NotesPage> {
  late Iterable<SubjectItems> subData;

  @override
  void initState() {
    var initData = ref.read(subjectDataProvider);
    subData = initData.where((obj) => obj.ntItm != 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var query = ref.watch(searchQueryProvider).toLowerCase();
    var filteredData = subData.where((subject) =>
        subject.subName.toLowerCase().contains(query) ||
        subject.subCode.any((code) => code.toLowerCase().contains(query)));
    return CustomScrollView(
      slivers: [
        SliverAppBarWidget(
          title: 'Notes',
          punch: 'Get your study material.',
          paddreq: false,
          expHeight: 220,
          bpadding: 5,
          tintColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 14, bottom: 12, left: 8, right: 8),
            child: MoonTextInput(
              height: 45,
              hintText: "Search in Notes",
              onChanged: (String value) =>
                  ref.read(searchQueryProvider.notifier).state = value,
              leading: const Icon(MoonIcons.generic_search_24_light),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: filteredData.length,
          itemBuilder: (context, index) {
            var subject = filteredData.elementAt(index);
            return ListWidget(sub: subject, type: "Notes");
          },
        ),
      ],
    );
  }
}
