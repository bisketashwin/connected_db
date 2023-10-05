// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityTicket _$CommodityTicketFromJson(Map<String, dynamic> json) =>
    CommodityTicket(
      id: json['id'] as String,
      commodityOwnerId: json['commodityOwnerId'] as String? ?? 'Not Generated',
      pickUpAddressId: json['pickUpAddressId'] as String? ?? 'Not Generated',
      destinationAddressId:
          json['destinationAddressId'] as String? ?? 'Not Generated',
      ticketNumber: json['ticketNumber'] as String? ?? 'Not Generated',
      goodMovement: json['goodMovement'] as String,
      commodity: json['commodity'] as String,
      quantity: json['quantity'] as String,
      contactPerson: json['contactPerson'] as String,
      phoneNumber: json['phoneNumber'] as String,
      transportType: json['transportType'] as String? ?? 'Company',
      pickupDate: DateTime.parse(json['pickupDate'] as String),
    );

Map<String, dynamic> _$CommodityTicketToJson(CommodityTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commodityOwnerId': instance.commodityOwnerId,
      'pickUpAddressId': instance.pickUpAddressId,
      'destinationAddressId': instance.destinationAddressId,
      'ticketNumber': instance.ticketNumber,
      'goodMovement': instance.goodMovement,
      'commodity': instance.commodity,
      'quantity': instance.quantity,
      'contactPerson': instance.contactPerson,
      'phoneNumber': instance.phoneNumber,
      'transportType': instance.transportType,
      'pickupDate': instance.pickupDate.toIso8601String(),
    };
