import '../../models/models.dart';

CommodityTicket commodityTicket2() {
  return CommodityTicket(
    commodityOwner: CommodityOwner(
      firmName: 'Acme Corporation',
      proprietorName: 'Rajesh Fegal',
    ),
    commodity: 'Wheat',
    quantity: '100 MT',
    contactPerson: 'Prakas Kumar Mitra',
    phoneNumber: '76545 45632',
    transportType: 'self',
    pickUpAddress: Address(
      firmName: 'Acme Corporation',
      street: 'Sy 79/6, Muppadighatta, Madhure Hobli',
      villageOrTaluk: 'Dodballapur',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '561204',
      googleMapLocation: 'https://maps.app.goo.gl/wJzH77fSxGJ4R7Gw6',
    ),
    destinationAddress: Address(
      firmName: 'Access Warehousing',
      street:
          '4th Block, 37/3, 80 Feet Ring Rd, 4th Block, Stage 1, KHB Colony',
      villageOrTaluk: 'Basaveshwar Nagar',
      zilla: 'Bengaluru City',
      state: 'Karnataka ',
      pincode: '560079',
      googleMapLocation: 'https://maps.app.goo.gl/akW4WghWvEwvZvut6',
    ),
    // pickupDate: dateFormat.parse('30-October-2023 8:00 am'),
    pickupDate: DateTime.parse('2023-10-03 08:00:00Z'),
  );
}
