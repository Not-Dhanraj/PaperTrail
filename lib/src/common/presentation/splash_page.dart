import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/main.dart';
import 'package:papertrail/src/app.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/presentation/error_page.dart';
import 'package:restart_app/restart_app.dart';

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
      navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
        builder: (context) {
          return MyHomePage(
            title: "PaperTrail",
          );
        },
      ));
    } else {
      navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
        builder: (context) {
          return ErrorPage(
            onRetry: () {
              Restart.restartApp();
            },
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Center(
              child: Card(
                child: Image.asset(
                  'assets/icon/icon.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple[900],
                        )),
                    SizedBox(
                      width: 20,
                    ),
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
          ],
        ),
      ),
    );
  }
}
