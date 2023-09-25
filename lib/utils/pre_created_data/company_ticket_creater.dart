import 'package:get/get.dart';

import '../models/address_model.dart';
import '../models/commodity_ticket_model.dart';
import '../controllers/commodity_ticket_controller.dart';

CommodityTicket commodityTicket1 = CommodityTicket(
  id: '',
  companyName: 'Acme Corporation',
  commodity: 'Wheat',
  quantity: '100 MT',
  contactPerson: 'Prakas Kumar Mitra',
  phoneNumber: '76545 45632',
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
    street: '4th Block, 37/3, 80 Feet Ring Rd, 4th Block, Stage 1, KHB Colony',
    villageOrTaluk: 'Basaveshwar Nagar',
    zilla: 'Bengaluru City',
    state: 'Karnataka ',
    pincode: '560079',
    googleMapLocation: 'https://maps.app.goo.gl/akW4WghWvEwvZvut6',
  ),
  pickupDate: DateTime.parse('2023-09-26'),
);

CommodityTicket commodityTicket2 = CommodityTicket(
  id: '',
  companyName: 'MSR Fruits Farm',
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
  pickupDate: DateTime.parse('2023-09-27'),
);

// Add the commodity tickets to the list.
createDummyCommodityTickets() {
  // Get the CommodityTicketController instance.
  CommodityTicketController commodityTicketController = Get.find();
  commodityTicketController.addCommodityTicket(commodityTicket1);
  commodityTicketController.addCommodityTicket(commodityTicket2);
}
