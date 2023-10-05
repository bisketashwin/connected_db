// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as String,
      firmName: json['firmName'] as String,
      nickName: json['nickName'] as String? ?? 'N/A',
      street: json['street'] as String,
      villageOrTaluk: json['villageOrTaluk'] as String,
      zilla: json['zilla'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      googleMapLocation: json['googleMapLocation'] as String? ?? 'N/A',
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'firmName': instance.firmName,
      'nickName': instance.nickName,
      'street': instance.street,
      'villageOrTaluk': instance.villageOrTaluk,
      'zilla': instance.zilla,
      'state': instance.state,
      'googleMapLocation': instance.googleMapLocation,
      'pincode': instance.pincode,
    };
