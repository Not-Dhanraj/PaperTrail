import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: MoonAvatar(
                backgroundColor: Theme.of(context).dividerColor,
                content: Icon(MoonIcons.files_add_24_regular),
              ),
              title: Text('Title goes Here'),
              subtitle: Text("This is the description of title"),
              trailing: const Icon(MoonIcons.controls_chevron_right_24_light),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
