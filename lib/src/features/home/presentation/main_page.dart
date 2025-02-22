import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 15, bottom: 5),
            child: Text(
              "Home",
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
              "Midterms",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Title goes Here'),
              subtitle: Text("This is the description of title"),
              trailing: const Icon(MoonIcons.controls_chevron_right_24_light),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Endterms",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Title goes Here'),
              subtitle: Text("This is the description of title"),
              trailing: const Icon(MoonIcons.controls_chevron_right_24_light),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: MoonAvatar(
                backgroundColor: Theme.of(context).dividerColor,
                content: Icon(MoonIcons.files_add_24_regular),
              ),
              title: Text('Title goes Here'),
              subtitle: Text("This is the description of title"),
              trailing: const Icon(MoonIcons.controls_chevron_right_24_light),
            );
          },
        ),
      ],
    );
  }
}
