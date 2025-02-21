import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/src/features/pageview/domain/pgv_nav.dart';

class PageViewService extends Notifier<PageViewNavigation> {
  @override
  PageViewNavigation build() {
    var controller = PageController();
    return PageViewNavigation(pageController: controller, currentindex: 0);
  }

  void updateIndex(int i) {
    state.currentindex = i;
    ref.notifyListeners();
  }
}

final pageViewService =
    NotifierProvider<PageViewService, PageViewNavigation>(PageViewService.new);
