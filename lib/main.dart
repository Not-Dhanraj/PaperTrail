import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/const.dart';
import 'package:papertrail/src/common/presentation/splash_page.dart';
import 'package:papertrail/src/features/theme/application/themer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await _initDisplayMode() : null;
  await Supabase.initialize(
    url: supUrl,
    anonKey: annonKey,
  );
  runApp(ProviderScope(child: const MyApp()));
}

Future<void> _initDisplayMode() async {
  try {
    double max = 0.0;
    late DisplayMode maxMode;
    final modes = await FlutterDisplayMode.supported;
    for (var mode in modes) {
      final current = (mode.width * mode.height * mode.refreshRate);
      if (current > max) {
        maxMode = mode;
        max = current;
      }
    }

    FlutterDisplayMode.setPreferredMode(maxMode);
  } on PlatformException catch (exception, stackTrace) {
    debugPrint("$exception\n$stackTrace");
  } catch (exception, stackTrace) {
    debugPrint("$exception\n$stackTrace");
  }
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
      navigatorKey: navigatorKey,
      home: SplashLoadingPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
