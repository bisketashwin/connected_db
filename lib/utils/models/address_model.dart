import 'package:get/get.dart';

class Address extends GetxController {
  final String firmName;
  final String street;
  final String villageOrTaluk;
  final String zilla;
  final String state;
  final String pincode;
  String googleMapLocation;

  Address({
    required this.firmName,
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
      street: json['street'] as String,
      villageOrTaluk: json['villageOrTaluk'] as String,
      zilla: json['zilla'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      googleMapLocation: json['googleMapLocation'] as String,
    );
  }
}
