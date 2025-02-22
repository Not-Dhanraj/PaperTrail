import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:proj_app/src/features/exams/presentation/exams_page.dart';
import 'package:proj_app/src/features/home/presentation/main_page.dart';
import 'package:proj_app/src/features/notes/presentation/notes_page.dart';
import 'package:proj_app/src/features/settings/presentation/settings_page.dart';

class PageviewPages extends StatelessWidget {
  final int index;
  const PageviewPages({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return MainPage();
      case 1:
        return NotesPage();
      case 2:
        return ExamsPage();
      case 3:
        return SettingsPage();
      default:
        return Center(child: MoonCircularLoader());
    }
  }
}
