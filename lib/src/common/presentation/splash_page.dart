import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/src/common/data/sub_data.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (() {
          switch (a) {
            case -1:
              return Text('Loading');
            case 1:
              return Icon(Icons.star);
            default:
              return Container();
          }
        })(),
      ),
    );
  }
}
