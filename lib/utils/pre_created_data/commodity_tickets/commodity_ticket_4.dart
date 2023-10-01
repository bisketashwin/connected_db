import '../../models/models.dart';

CommodityTicket commodityTicket4() {
  return CommodityTicket(
    commodityOwner: CommodityOwner(
      firmName: 'Organic Harvest',
      proprietorName: 'Priya Singh',
    ),
    goodMovement: 'Inward',
    commodity: 'Tomatoes',
    quantity: '60 MT',
    contactPerson: 'Arun Kumar',
    phoneNumber: '7890123456',
    pickUpAddress: Address(
      firmName: 'Organic Harvest',
      street: 'Sy 45/1, Mallathahalli, Magadi Road',
      villageOrTaluk: 'Magadi Road',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '560091',
      googleMapLocation: 'https://maps.app.goo.gl/def789',
    ),
    destinationAddress: Address(
      firmName: 'Cool Storage',
      street: '7th Main, BTM Layout',
      villageOrTaluk: 'BTM Layout',
      zilla: 'Bengaluru City',
      state: 'Karnataka',
      pincode: '560029',
      googleMapLocation: 'https://maps.app.goo.gl/pqr123',
    ),
    pickupDate: DateTime.parse('2023-09-30 14:15:00Z'),
  );
}
