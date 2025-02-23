import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proj_app/src/common/data/sub_item_repo.dart';
import 'package:proj_app/src/common/domain/sub_items.dart';

final subItemsProvider = FutureProvider<List<SubjectItems>>((ref) async {
  final subRepo = ref.watch(subRepoService);
  return subRepo.fetchSubjects();
});
