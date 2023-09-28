import '../../models/models.dart';

CommodityTicket commodityTicket3() {
  return CommodityTicket(
    commodityOwner: CommodityOwner(
      firmName: 'Green Farms',
      proprietorName: 'Suresh Reddy',
    ),
    commodity: 'Rice',
    quantity: '80 MT',
    contactPerson: 'Anita Sharma',
    phoneNumber: '9876543210',
    pickUpAddress: Address(
      firmName: 'Green Farms',
      street: 'Sy 56/2, Gundanapalya, Kothanur Post',
      villageOrTaluk: 'Yelahanka',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '560065',
      googleMapLocation: 'https://maps.app.goo.gl/abc123',
    ),
    destinationAddress: Address(
      firmName: 'Fresh Stores',
      street: 'No. 32, 5th Cross, Marathahalli',
      villageOrTaluk: 'Marathahalli',
      zilla: 'Bengaluru City',
      state: 'Karnataka',
      pincode: '560037',
      googleMapLocation: 'https://maps.app.goo.gl/xyz456',
    ),
    pickupDate: DateTime.parse('2023-10-10 09:30:00Z'),
  );
}
