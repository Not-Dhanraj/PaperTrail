class SubjectItems {
  final List<String> subCode;
  final String subName;
  final int mtItm;
  final int etItm;
  final int solItm;
  final int ntItm;

  SubjectItems(
      {required this.subCode,
      required this.subName,
      required this.mtItm,
      required this.solItm,
      required this.etItm,
      required this.ntItm});

  factory SubjectItems.fromJson(Map<String, dynamic> json) {
    List<String> subCodes;
    if (json['sub_code'] is List) {
      subCodes = List<String>.from(json['sub_code']);
    } else if (json['sub_code'] is String) {
      subCodes = [json['sub_code']];
    } else {
      subCodes = [];
    }

    return SubjectItems(
      subCode: subCodes,
      subName: json['sub_name'] as String,
      mtItm: json['mt_itms'] as int,
      solItm: json['nots_itms'] as int,
      etItm: json['et_itms'] as int,
      ntItm: json['nots_itms'] as int,
    );
  }
}
