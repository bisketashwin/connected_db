import '../../models/models.dart';

CommodityTicket commodityTicket1() {
  return CommodityTicket(
    commodityOwner: CommodityOwner(
        firmName: 'MSR Fruits Farm', proprietorName: 'Ujjanagowda Patil'),
    goodMovement: 'Inward',
    commodity: 'Grapes',
    quantity: '120 MT',
    contactPerson: 'Ramesh Patil',

    phoneNumber: '9632115645',

    pickUpAddress: Address(
      firmName: 'MSR Fruits Farm',
      street: 'Chikka Kukkanahalli, Guddarahalli, hearaghatta',
      villageOrTaluk: 'hearaghatta',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '560089',
      googleMapLocation: 'https://maps.app.goo.gl/aGY9oyaXLxN3jmpa7',
    ),
    destinationAddress: Address(
      firmName: 'Isiri Cold Storage',
      street: 'Sy, 74, 86 & 87, NH-4, Sompura, Industrial Area, Dobbaspet',
      villageOrTaluk: 'Nelamangala',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '562111',
      googleMapLocation:
          'https://maps.google.com/?q=123+Main+Street,+San+Francisco,+CA+94105',
    ),
    pickupDate: DateTime.parse('2023-09-27 16:00:00Z'),
    // pickupDate: dateFormat.parse('23-September-2023 12:00 pm'),
  );
}
