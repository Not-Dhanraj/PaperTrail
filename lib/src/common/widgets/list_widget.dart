import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';
import 'package:papertrail/src/common/presentation/item_page.dart';
import 'package:papertrail/src/features/fav/services/fav_provider.dart';

class ListWidget extends ConsumerWidget {
  final SubjectItems sub;
  final String type;
  const ListWidget({super.key, required this.sub, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritesProvider);
    final isFav = favoriteIds.contains(sub.id);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: ListTile(
          leading: MoonButton.icon(
            backgroundColor: isFav ? Colors.redAccent[400] : null,
            icon: Icon(
              MoonIcons.generic_bookmark_24_regular,
            ),
            onTap: () {
              ref.read(favoritesProvider.notifier).toggleFavorite(sub.id);
            },
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
