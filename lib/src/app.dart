import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/src/features/pageview/presentation/bottom_nav/bottom_nav.dart';
import 'package:proj_app/src/features/pageview/presentation/pg_view/pageview_widget.dart';
import 'package:proj_app/src/features/theme/application/themer.dart';

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
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageviewWidget(),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: Consumer(builder: (context, ref, child) {
        var tp = ref.watch(themeProvider.notifier);
        return FloatingActionButton(
          onPressed: () {
            if (Theme.of(context).brightness == Brightness.dark)
              tp.switchMode(ThemeMode.light);
            else
              tp.switchMode(ThemeMode.dark);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
