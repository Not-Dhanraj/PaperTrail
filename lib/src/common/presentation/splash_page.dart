import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/main.dart';
import 'package:proj_app/src/app.dart';
import 'package:proj_app/src/common/data/sub_data.dart';
import 'package:proj_app/src/common/presentation/error_page.dart';

class SplashLoadingPage extends ConsumerStatefulWidget {
  const SplashLoadingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashLoadingPageState();
}

class _SplashLoadingPageState extends ConsumerState<SplashLoadingPage> {
  int a = -1;
  @override
  void initState() {
    initSub();
    super.initState();
  }

  void initSub() async {
    var subData = ref.read(subjectDataProvider.notifier);
    a = await subData.initSubData();
    Future.delayed(Duration(milliseconds: 300), () {
      navigatePages();
    });
  }

  void navigatePages() {
    if (a == 0) {
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) {
          return MyHomePage(
            title: "TEst App",
          );
        },
      ));
    } else {
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) {
          return ErrorPage(
            onRetry: () {
              //TODO implement toRetry
            },
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.flutter_dash,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4,
              ),
              const SizedBox(height: 20),
              const Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
