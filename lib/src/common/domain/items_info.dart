class ItemsInfo {
  final List<String> subCode;
  final String fName;
  final String fLink;

  ItemsInfo({
    required this.subCode,
    required this.fName,
    required this.fLink,
  });

  factory ItemsInfo.fromJson(Map<String, dynamic> json) {
    List<String> subCodes;
    if (json['sub_code'] is List) {
      subCodes = List<String>.from(json['sub_code']);
    } else if (json['sub_code'] is String) {
      subCodes = [json['sub_code']];
    } else {
      subCodes = [];
    }

    return ItemsInfo(
      subCode: subCodes,
      fName: json['f_name'] as String,
      fLink: json['f_link'] as String,
    );
  }
}
