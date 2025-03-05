// This provider should be replaced with the actual data provider you have
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/data/sub_data.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';

class FilteredSubjectsNotifier extends StateNotifier<List<SubjectItems>> {
  final List<SubjectItems> subjects;
  final String filterType;

  FilteredSubjectsNotifier(this.subjects, this.filterType) : super([]) {
    _applyInitialFilter();
  }

  void _applyInitialFilter() {
    state = subjects.where((subject) {
      return (filterType == 'mid' && subject.mtItm > 0) ||
          (filterType == 'end' && subject.etItm > 0) ||
          (filterType == 'quiz' && subject.quizItms > 0) ||
          (filterType == 'notes' && subject.ntItm > 0);
    }).toList();
  }

  void filter(String query) {
    state = subjects.where((subject) {
      final matchesQuery = query.isEmpty ||
          subject.subName.toLowerCase().contains(query.toLowerCase()) ||
          subject.subCode
              .any((code) => code.toLowerCase().contains(query.toLowerCase()));

      final matchesFilter = (filterType == 'mid' && subject.mtItm > 0) ||
          (filterType == 'end' && subject.etItm > 0) ||
          (filterType == 'quiz' && subject.quizItms > 0) ||
          (filterType == 'notes' && subject.ntItm > 0);

      return matchesQuery && matchesFilter;
    }).toList();
  }
}

final filteredSubjectsProvider = StateNotifierProvider.family<
    FilteredSubjectsNotifier, List<SubjectItems>, String>(
  (ref, filterType) =>
      FilteredSubjectsNotifier(ref.watch(subjectDataProvider), filterType),
);
