// This provider should be replaced with the actual data provider you have
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';

final searchQueryProvider = StateProvider<String>((ref) => "");

final filteredSubjectsProvider = Provider<List<SubjectItems>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final subjects = ref.watch(subjectDataProvider);

  if (query.isEmpty) {
    return subjects;
  }

  return subjects.where((subject) {
    return subject.subName.toLowerCase().contains(query) ||
        subject.subCode.any((code) => code.toLowerCase().contains(query));
  }).toList();
});
