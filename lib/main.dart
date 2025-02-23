import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/const.dart';
import 'package:proj_app/src/app.dart';
import 'package:proj_app/src/common/presentation/splash_page.dart';
import 'package:proj_app/src/features/theme/application/themer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: supUrl,
    anonKey: annonKey,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeref = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeref.currTheme,
      theme: themeref.lightTheme,
      darkTheme: themeref.darkTheme,
      home: SplashLoadingPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
