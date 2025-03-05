import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredSubjects = ref.watch(filteredSubjectsProvider);

    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     onChanged: (value) =>
        //         ref.read(searchQueryProvider.notifier).state = value,
        //     decoration: const InputDecoration(
        //       labelText: "Search by Name or Code",
        //       prefixIcon: Icon(Icons.search),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MoonTextInput(
            hintText: "Search by Name or Code",
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
            itemCount: filteredSubjects.length,
            itemBuilder: (context, index) {
              final subject = filteredSubjects[index];
              return ListTile(
                title: Text(subject.subName),
                subtitle: Text("Subject codes: ${subject.subCode.join(', ')}"),
              );
            },
          ),
        ),
      ],
    );
  }
}
