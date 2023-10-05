// commodity_ticket_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'commodity_ticket_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommodityTicket {
  String id;
  String commodityOwnerId;
  String pickUpAddressId;
  String destinationAddressId;
  String ticketNumber;
  String goodMovement;
  String commodity;
  String quantity;
  String contactPerson;
  String phoneNumber;
  String transportType;
  DateTime pickupDate;

  CommodityTicket({
    required this.id,
    this.commodityOwnerId = 'Not Generated',
    this.pickUpAddressId = 'Not Generated',
    this.destinationAddressId = 'Not Generated',
    this.ticketNumber = 'Not Generated',
    required this.goodMovement,
    required this.commodity,
    required this.quantity,
    required this.contactPerson,
    required this.phoneNumber,
    this.transportType = 'Company',
    required this.pickupDate,
  });

  factory CommodityTicket.fromJson(Map<String, dynamic> json) =>
      _$CommodityTicketFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityTicketToJson(this);
}
