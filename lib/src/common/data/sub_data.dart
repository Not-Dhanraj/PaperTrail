import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/data/sub_item_repo.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';

class SubjectItemsNotifier extends Notifier<List<SubjectItems>> {
  @override
  build() {
    return List<SubjectItems>.empty(growable: true);
  }

  Future<int> initSubData() async {
    final subRepo = ref.watch(subRepoService);
    try {
      state = await subRepo.fetchSubjects();
      ref.notifyListeners();
      if (kDebugMode) {
        print("length: ${state.length}");
      }
      if (state.isEmpty) return 1;
      return 0;
    } catch (e) {
      return 1;
    }
  }
}

final subjectDataProvider =
    NotifierProvider<SubjectItemsNotifier, List<SubjectItems>>(
        SubjectItemsNotifier.new);
