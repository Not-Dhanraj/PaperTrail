import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';

class SolutionPage extends ConsumerWidget {
  const SolutionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return ListTile(
          // tileColor: Colors.grey,
          leading: MoonAvatar(
            backgroundColor: Theme.of(context).dividerColor,
            content: Icon(MoonIcons.files_add_24_regular),
          ),
          // isThreeLine: true,
          title: Text(
            'Subject Name',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("This is the description of \ntitle"),
          trailing: MoonButton(
            height: 35,
            backgroundColor:
                Theme.of(context).dividerColor.withValues(alpha: 0.5),
            label: Text('View'),
            onTap: () {},
          ),
        );
      },
    );
  }
}
