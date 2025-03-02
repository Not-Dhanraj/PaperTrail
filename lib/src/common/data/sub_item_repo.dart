import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/domain/sub_items.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubRepoService {
  Future<List<SubjectItems>> fetchSubjects() async {
    final response =
        await Supabase.instance.client.from('papers_info').select();

    final List<dynamic> data = response;
    return data.map((json) => SubjectItems.fromJson(json)).toList();
  }
}

final subRepoService = Provider<SubRepoService>((ref) {
  return SubRepoService();
});
