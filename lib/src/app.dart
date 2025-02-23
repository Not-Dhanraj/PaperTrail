import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proj_app/src/common/data/sub_item_repo.dart';
import 'package:proj_app/src/features/pageview/presentation/bottom_nav/bottom_nav.dart';
import 'package:proj_app/src/features/pageview/presentation/pg_view/pageview_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: PageviewWidget(),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final supabase = await SubRepoService().fetchSubjects();

          if (kDebugMode) {
            print(supabase.first.subCode);
          }
        },
      ),
    );
  }
}
