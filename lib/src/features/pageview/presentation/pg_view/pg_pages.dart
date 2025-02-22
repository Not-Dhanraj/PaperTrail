import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class PageviewPages extends StatelessWidget {
  final int index;
  const PageviewPages({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return Center(child: Text("Page 1"));
      case 1:
        return Center(child: Text("New 2"));
      case 2:
        return Center(child: Text("New Page 3"));
      case 3:
        return Center(child: Text("Page 4"));
      default:
        return Center(child: MoonCircularLoader());
    }
  }
}
