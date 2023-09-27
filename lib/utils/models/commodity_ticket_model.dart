// commodity_ticket_model.dart

import 'address_model.dart';
import 'commodity_owner_model.dart';

class CommodityTicket {
  String id;
  String ticketNumber;
  final CommodityOwner commodityOwner;
  String commodity;
  String quantity;
  String contactPerson;
  String phoneNumber;

  // Add the address fields.
  final Address pickUpAddress;
  final Address destinationAddress;

  // Add the pickupDate field.
  final DateTime pickupDate;

  CommodityTicket({
    this.id = '',
    this.ticketNumber = 'Not Generated',
    required this.commodityOwner,
    required this.commodity,
    required this.quantity,
    required this.contactPerson,
    required this.phoneNumber,
    required this.pickUpAddress,
    required this.destinationAddress,
    required this.pickupDate,
  });

  factory CommodityTicket.fromJson(Map<String, dynamic> json) {
    return CommodityTicket(
      id: json['id'] as String,
      ticketNumber: json['ticketNumber'] as String,
      commodityOwner: CommodityOwner.fromJson(
          json['commodityOwner'] as Map<String, dynamic>),
      commodity: json['commodity'] as String,
      quantity: json['quantity'] as String,
      contactPerson: json['contactPerson'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pickUpAddress:
          Address.fromJson(json['pickUpAddress'] as Map<String, dynamic>),
      destinationAddress:
          Address.fromJson(json['destinationAddress'] as Map<String, dynamic>),
      pickupDate: DateTime.parse(json['pickupDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticketNumber': ticketNumber,
      'commodityOwner': commodityOwner.toJson(),
      'commodity': commodity,
      'quantity': quantity,
      'contactPerson': contactPerson,
      'phoneNumber': phoneNumber,
      'pickUpAddress': pickUpAddress.toJson(),
      'destinationAddress': destinationAddress.toJson(),
      'pickupDate': pickupDate.toString(),
    };
  }
}
