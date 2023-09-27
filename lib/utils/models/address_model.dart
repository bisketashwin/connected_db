// address_model.dart

import 'package:get/get.dart';

class Address extends GetxController {
  String firmName;
  String nickName;
  String street;
  String villageOrTaluk;
  String zilla;
  String state;
  String pincode;
  String googleMapLocation;

  Address({
    required this.firmName,
    this.nickName = 'N/A',
    required this.street,
    required this.villageOrTaluk,
    required this.zilla,
    required this.state,
    required this.pincode,
    this.googleMapLocation = 'not provided',
  });

  Map<String, dynamic> toJson() {
    return {
      'firmName': firmName,
      'nickName': nickName,
      'street': street,
      'villageOrTaluk': villageOrTaluk,
      'zilla': zilla,
      'state': state,
      'pincode': pincode,
      'googleMapLocation': googleMapLocation,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      firmName: json['firmName'] as String,
      nickName: json['nickName'] as String,
      street: json['street'] as String,
      villageOrTaluk: json['villageOrTaluk'] as String,
      zilla: json['zilla'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      googleMapLocation: json['googleMapLocation'] as String,
    );
  }
}
