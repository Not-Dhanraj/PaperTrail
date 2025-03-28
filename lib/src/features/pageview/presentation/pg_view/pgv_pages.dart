import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/features/exams/presentation/exams_page.dart';
import 'package:papertrail/src/features/notes/presentation/notes_page.dart';
import 'package:papertrail/src/features/settings/presentation/settings_page.dart';

class PageviewPages extends StatelessWidget {
  final int index;
  const PageviewPages({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return NotesPage();
      case 1:
        return ExamsPage();
      case 2:
        return SettingsPage();
      default:
        return Center(child: MoonCircularLoader());
    }
  }
}
