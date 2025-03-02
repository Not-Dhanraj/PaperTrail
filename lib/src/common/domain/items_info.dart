class ItemsInfo {
  final int id;
  final String fName;
  final String fLink;

  ItemsInfo({
    required this.id,
    required this.fName,
    required this.fLink,
  });

  factory ItemsInfo.fromJson(Map<String, dynamic> json) {
    return ItemsInfo(
      id: json['paper_id'] as int,
      fName: json['f_name'] as String,
      fLink: json['f_link'] as String,
    );
  }
}
