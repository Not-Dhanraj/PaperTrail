import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/presentation/item_page.dart';
import 'package:papertrail/src/features/search/services/search_service.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredSubjects = ref.watch(filteredSubjectsProvider('quiz'));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 0, left: 8, right: 8),
          child: MoonTextInput(
            hintText: "Search in Quizzes",
            onChanged: (String value) =>
                ref.read(filteredSubjectsProvider('quiz').notifier).filter(
                      value,
                    ),
            leading: const Icon(MoonIcons.generic_search_24_light),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredSubjects.length,
            itemBuilder: (context, index) {
              var subject = filteredSubjects.elementAt(index);
              return ListTile(
                leading: MoonAvatar(
                  backgroundColor: Theme.of(context).dividerColor,
                  content: Icon(MoonIcons.files_add_24_regular),
                ),
                title: Text(
                  subject.subName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Subject Code: ${subject.subCode}"),
                trailing: MoonButton(
                  height: 35,
                  backgroundColor:
                      Theme.of(context).dividerColor.withValues(alpha: 0.5),
                  label: Text('View'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ItemPage(
                            subId: subject.id,
                            type: "Quiz",
                            subCode: subject.subCode);
                      },
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
