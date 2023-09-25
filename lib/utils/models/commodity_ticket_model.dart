// commodity_ticket_model.dart

import 'package:get/get.dart';
import 'address_model.dart';

class CommodityTicket extends GetxController {
  String id;
  final String companyName;
  final String commodity;
  final String quantity;
  final String contactPerson;
  final String phoneNumber;

  // Add the address fields.
  final Address pickUpAddress;
  final Address destinationAddress;

  // Add the pickupDate field.
  final DateTime pickupDate;

  CommodityTicket({
    required this.id,
    required this.companyName,
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
      companyName: json['companyName'] as String,
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
      'companyName': companyName,
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
