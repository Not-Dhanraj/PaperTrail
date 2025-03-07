import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/domain/items_info.dart';
import 'package:papertrail/src/common/services/downloader_service.dart';
import 'package:papertrail/src/common/widgets/sliver_appbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ItemPage extends ConsumerWidget {
  final String type;
  final int subId;
  final List<String> subCode;

  const ItemPage({
    super.key,
    required this.type,
    required this.subId,
    required this.subCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<String> getDb() async {
      switch (type) {
        case "Notes":
          return "notes";
        case "Mid Term":
          return "mt_paper";
        case "End Term":
          return "et_paper";
        case "Quiz":
          return "quiz";
        default:
          return "mt_paper";
      }
    }

    Future<List<ItemsInfo>> getItems() async {
      final List<dynamic> response = await Supabase.instance.client
          .from(await getDb())
          .select()
          .eq('paper_id', subId);
      return response.map((json) => ItemsInfo.fromJson(json)).toList();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            title: type,
            punch: 'Explore ${subCode.join(', ')}',
            expHeight: 200,
          ),
          SliverFillRemaining(
            child: FutureBuilder<List<ItemsInfo>>(
              future: getItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;

                  if (data.isNotEmpty) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var name = data.elementAt(index).fName;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              leading: MoonAvatar(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withValues(alpha: 0.5),
                                content: Icon(MoonIcons.files_add_24_regular),
                              ),
                              title: Text(
                                name[0].toUpperCase() +
                                    name.substring(1).toLowerCase(),
                              ),
                              subtitle: Text("Subject Code: $subCode"),
                              trailing: MoonButton(
                                height: 35,
                                backgroundColor: Theme.of(context)
                                    .dividerColor
                                    .withValues(alpha: 0.2),
                                label: Text('View file'),
                                onTap: () {
                                  ref
                                      .read(downloadProvider)
                                      .downloadFileAndNavigate(
                                        context,
                                        data.elementAt(index).fLink,
                                        data.elementAt(index).fName,
                                      );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("No $type papers found"),
                    );
                  }
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
