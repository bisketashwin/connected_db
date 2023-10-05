// address_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  String id;
  String firmName;
  String nickName;
  String street;
  String villageOrTaluk;
  String zilla;
  String state;
  String googleMapLocation;
  String pincode;

  Address({
    required this.id,
    required this.firmName,
    this.nickName = 'N/A',
    required this.street,
    required this.villageOrTaluk,
    required this.zilla,
    required this.state,
    required this.pincode,
    this.googleMapLocation = 'N/A',
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
