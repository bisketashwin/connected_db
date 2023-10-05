import 'package:json_annotation/json_annotation.dart';

part 'commodity_owner_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommodityOwner {
  String id;
  String firmName;
  String nickName;
  String proprietorName;

  CommodityOwner({
    required this.id,
    required this.firmName,
    this.nickName = 'N/A',
    required this.proprietorName,
  });

  factory CommodityOwner.fromJson(Map<String, dynamic> json) =>
      _$CommodityOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityOwnerToJson(this);
}
