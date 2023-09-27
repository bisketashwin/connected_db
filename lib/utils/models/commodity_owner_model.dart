// commodity_owner_model.dart

class CommodityOwner {
  String firmName;
  String? nickName;
  String? proprietorName;

  CommodityOwner({
    required this.firmName,
    this.nickName = '',
    this.proprietorName = '',
  });

  factory CommodityOwner.fromJson(Map<String, dynamic> json) {
    return CommodityOwner(
      firmName: json['firmName'],
      nickName: json['nickName'],
      proprietorName: json['proprietorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firmName': firmName,
      'nickName': nickName,
      'proprietorName': proprietorName,
    };
  }
}
