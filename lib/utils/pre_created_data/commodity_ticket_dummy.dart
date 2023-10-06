import '../models/models.dart';

CommodityTicket commodityTicket1() {
  return CommodityTicket(
    id: '00001',
    commodityOwnerId: '00001',
    contactPersonId: '00001',
    pickUpAddressId: '00001',
    destinationAddressId: '00001',
    goodMovement: 'Inward',
    commodity: 'Grapes',
    quantity: '120 MT',
    pickupDate: DateTime.parse('2023-09-27 16:00:00Z'),
  );
}

CommodityTicket commodityTicket2() {
  return CommodityTicket(
    id: '00002',
    commodityOwnerId: '00002',
    contactPersonId: '00002',
    pickUpAddressId: '00002',
    destinationAddressId: '00002',
    goodMovement: 'Inward',
    commodity: 'Wheat',
    quantity: '100 MT',
    transportType: 'self',
    pickupDate: DateTime.parse('2023-10-03 08:00:00Z'),
  );
}

CommodityTicket commodityTicket3() {
  return CommodityTicket(
    id: '00003',
    commodityOwnerId: '00003',
    contactPersonId: '00003',
    pickUpAddressId: '00003',
    destinationAddressId: '00003',
    goodMovement: 'Inward',
    commodity: 'Rice',
    quantity: '80 MT',
    pickupDate: DateTime.parse('2023-10-10 09:30:00Z'),
  );
}

CommodityTicket commodityTicket4() {
  return CommodityTicket(
    id: '00004',
    commodityOwnerId: '00004',
    contactPersonId: '00004',
    pickUpAddressId: '00004',
    destinationAddressId: '00004',
    goodMovement: 'Inward',
    commodity: 'Tomatoes',
    quantity: '60 MT',
    pickupDate: DateTime.parse('2023-09-30 14:15:00Z'),
  );
}
