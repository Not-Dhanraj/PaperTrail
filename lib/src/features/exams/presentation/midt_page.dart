import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';

class MidTermsPage extends ConsumerWidget {
  const MidTermsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return ListTile(
          leading: MoonAvatar(
            backgroundColor: Theme.of(context).dividerColor,
            content: Icon(MoonIcons.files_add_24_regular),
          ),
          title: Text(
            'Subject Name',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("This is the description of title"),
          trailing: const Icon(MoonIcons.controls_chevron_right_24_light),
          onTap: () {},
        );
      },
    );
  }
}
